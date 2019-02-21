Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from atl4mhob04.registeredsite.com ([209.17.115.42])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmy4-0001Kc-4d
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 11:56:45 +0000
Received: from mailpod.hostingplatform.com
 (atl4qobmail01pod5.registeredsite.com [10.30.71.94])
 by atl4mhob04.registeredsite.com (8.14.4/8.14.4) with ESMTP id x1LBubpB015964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ath10k@lists.infradead.org>; Thu, 21 Feb 2019 06:56:37 -0500
Received: from localhost (localhost [127.0.0.1])
 by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id EEE21154043E
 for <ath10k@lists.infradead.org>; Thu, 21 Feb 2019 06:56:35 -0500 (EST)
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
 by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1M4_Q2vsLKxs for <ath10k@lists.infradead.org>;
 Thu, 21 Feb 2019 06:56:29 -0500 (EST)
Received: from w7.lan (w7.lan [192.168.1.9])
 by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 6F7FB15403A1
 for <ath10k@lists.infradead.org>; Thu, 21 Feb 2019 06:56:29 -0500 (EST)
Message-ID: <5c6cebd6325381949f95803abe2ebfd15eb39b0c.camel@ewol.com>
Subject: Can't parse chan info event return from firmware 10.2.4-1.0-00043
From: Steve Brown <sbrown@ewol.com>
Date: Thu, 21 Feb 2019 06:56:29 -0500
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

I get "ath10k_pci 0000:03:00.0: failed to parse chan info event: -71"
when scanning.

After some instrumentation, the return is 7 words and the event
structure size is 13 words. This causes the error.

As only the first 6 words are recovered, it's not clear if the problem
is the size of the event structure or the test.

The kernel was built from kvalo/ath.git
7ce94a62264be94dc1c41ff5d0c8a19c7f0d3143.

Samples below.

Steve

================
Feb 21 05:50:16 w7 kernel: [39829.224813] ath10k_pci 0000:03:00.0: scan event foreign channel type 8 reason 3 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
Feb 21 05:50:16 w7 kernel: [39829.224816] ath10k_wmi_op_pull_ch_info_ev: skb->len:28 sizeof(ev):52
Feb 21 05:50:16 w7 kernel: [39829.224819] ath10k_pci 0000:03:00.0: wmi chan info: 00000000: 00 00 00 00 6c 09 00 00 00 00 00 00 00 00 00 00  ....l...........
Feb 21 05:50:16 w7 kernel: [39829.224822] ath10k_pci 0000:03:00.0: wmi chan info: 00000010: 81 2c fa 01 8c 8d 7b 33 3c da 39 00              .,....{3<.9.
Feb 21 05:50:16 w7 kernel: [39829.224823] ath10k_wmi_event_chan_info: ret:-71
Feb 21 05:50:16 w7 kernel: [39829.224825] ath10k_pci 0000:03:00.0: failed to parse chan info event: -71
Feb 21 05:50:16 w7 kernel: [39829.267441] ath10k_pci 0000:03:00.0: scan event bss channel type 4 reason 3 freq 2412 req_id 40961 scan_id 40960 vdev_id 0 state running (2)
Feb 21 05:50:16 w7 kernel: [39829.267445] ath10k_wmi_op_pull_ch_info_ev: skb->len:28 sizeof(ev):52
Feb 21 05:50:16 w7 kernel: [39829.267448] ath10k_pci 0000:03:00.0: wmi chan info: 00000000: 00 00 00 00 6c 09 00 00 01 00 00 00 af ff ff ff  ....l...........
Feb 21 05:50:16 w7 kernel: [39829.267451] ath10k_pci 0000:03:00.0: wmi chan info: 00000010: 14 ee fa 01 17 c7 b4 33 2a dd 39 00              .......3*.9.
Feb 21 05:50:16 w7 kernel: [39829.267452] ath10k_wmi_event_chan_info: ret:-71
Feb 21 05:50:16 w7 kernel: [39829.267454] ath10k_pci 0000:03:00.0: failed to parse chan info event: -71
================


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
