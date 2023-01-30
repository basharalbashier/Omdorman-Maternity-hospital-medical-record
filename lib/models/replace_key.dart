String replacLabKey(String key) {
  var hl = {
    'Urine general': 'urine',
    'Stool general': 'stoolG',
    'B F F M': 'bffm',
    'E S R': 'esr',
    'Stool for reducing substance': 'stoolF',
    'Viral Screening': 'viral',
    'B.G': 'bG',
    'C B C': 'cbc',
    'Sickling test': 'sick',
    'Retics Count': 'retic',
    'Platelet Count': 'plate',
    'Coagulation': 'coag',
    'PT + INR': 'pt',
    'PTT': 'ptt',
    'F B G ': 'fbg',
    '2 H B B': 'hbb',
    'R B G': 'rbg',
    'HbAIC': 'hbAIC',
    'C R P': 'crp',
    'Ca': 'ca',
    'L F T': 'lft',
    'R F T': 'rft',
    'Thyroid profile': 'thy',
    'Fertility profile': 'fer',
    'Ca 125': 'ca125',
    'Urine culture + sensitivity': 'urinC',
    'Stool culture + sensitivity': 'stoolCul',
    'Blood culture + sensitivity': 'bloodCul',
    'Fluid culture + sensitivity': 'fluidCul',
    'Wond swab': 'wond',
    'High vaginal swab': 'hiVag',
    'Histopathology': 'histo',
    "Cytology": 'cyto',
    'Status': 'status',
    // "Seen at": data['seen_at']==null?"In Progress..":data['seen_at'],
    // 'Sent':
    //     "${data['created_at'].substring(11, 16)}\n${data['created_at'].substring(0, 10)}",
  };
  ;

  var keySt = hl.entries.where((element) => element.value == key);

  return '${keySt.first.key}';
}
