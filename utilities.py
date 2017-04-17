import logging

import pandas


def format_issn(issn):
    """
    Reformat messy ISSNs that are potentially numerically-encoded.
    """
    if issn is None or pandas.isnull(issn):
        return None
    # Fix numericly-encoded ISSNs
    if not isinstance(issn, str):
        issn = str(int(issn))
        issn = issn.zfill(8)
    # Remove non-alphanumeric characters
    issn = ''.join(filter(str.isalnum, issn))
    if len(issn) != 8:
        logging.warning('ISSN does not have length 8: {}'.format(issn))
        return None
    # Hyphenate
    issn = '{}{}{}{}-{}{}{}{}'.format(*issn)
    return issn
