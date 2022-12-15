List<Map<String, dynamic>> replacLabKey(source) {
  List<Map<String, dynamic>> temps = [];

  for (var data in source) {
    temps.add({
      "id": data['id'],
      'Urine general': data['urine'] != 'false' ? data['urine'] : '-',
      'Stool general': data['stoolG'] != 'false' ? data['stoolG'] : '-',
      'B F F M': data['bffm'] != 'false' ? data['bffm'] : '-',
      'E S R': data['esr'] != 'false' ? data['esr'] : '-',
      'Stool for reducing substance':
          data['stoolF'] != 'false' ? data['stoolF'] : '-',
      'Viral Screening': data['viral'] != 'false' ? data['viral'] : '-',
      'B.G': data['bG'] != 'false' ? data['bG'] : '-',
      'C B C': data['cbc'] != 'false' ? data['cbc'] : '-',
      'Sickling test': data['sick'] != 'false' ? data['sick'] : '-',
      'Retics Count': data['retic'] != 'false' ? data['retic'] : '-',
      'Platelet Count': data['plate'] != 'false' ? data['plate'] : '-',
      'Coagulation': data['coag'] != 'false' ? data['coag'] : '-',
      'PT + INR': data['pt'] != 'false' ? data['pt'] : '-',
      'PTT': data['ptt'] != 'false' ? data['ptt'] : '-',
      'F B G ': data['fbg'] != 'false' ? data['fbg'] : '-',
      '2 H B B': data['hbb'] != 'false' ? data['hbb'] : '-',
      'R B G': data['rbg'] != 'false' ? data['rbg'] : '-',
      'HbAIC': data['hbAIC'] != 'false' ? data['hbAIC'] : '-',
      'C R P': data['crp'] != 'false' ? data['crp'] : '-',
      'Ca': data['ca'] != 'false' ? data['ca'] : '-',
      'L F T': data['lft'] != 'false' ? data['lft'] : '-',
      'R F T': data['rft'] != 'false' ? data['rft'] : '-',
      'Thyroid profile': data['thy'] != 'false' ? data['thy'] : '-',
      'Fertility profile': data['fer'] != 'false' ? data['fer'] : '-',
      'Ca 125': data['ca125'] != 'false' ? data['ca125'] : '-',
      'Urine culture + sensitivity':
          data['urinC'] != 'false' ? data['urinC'] : '-',
      'Stool culture + sensitivity':
          data['stoolCul'] != 'false' ? data['stoolCul'] : '-',
      'Blood culture + sensitivity':
          data['bloodCul'] != 'false' ? data['bloodCul'] : '-',
      'Fluid culture + sensitivity':
          data['fluidCul'] != 'false' ? data['fluidCul'] : '-',
      'Wond swab': data['wond'] != 'false' ? data['wond'] : '-',
      'High vaginal swab': data['hiVag'] != 'false' ? data['hiVag'] : '-',
      'Histopathology': data['histo'] != 'false' ? data['histo'] : '-',
      "Cytology": data['cyto'] != 'false' ? data['cyto'] : '-',
      'Status': data['status'],
      // "Seen at": data['seen_at']==null?"In Progress..":data['seen_at'],
      'Sent':
          "${data['created_at'].substring(11, 16)}\n${data['created_at'].substring(0, 10)}",
    });
  }

  return temps;
}
