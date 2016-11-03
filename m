Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2MHv-0003at-3c
 for ath10k@lists.infradead.org; Thu, 03 Nov 2016 17:58:56 +0000
Received: by mail-oi0-x22d.google.com with SMTP id v84so101084407oie.3
 for <ath10k@lists.infradead.org>; Thu, 03 Nov 2016 10:58:34 -0700 (PDT)
MIME-Version: 1.0
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 3 Nov 2016 10:58:33 -0700
Message-ID: <CAJ-VmokO7F1_HA+Td_COqO+v-aHy-uc-033KwV0ZYts+8d6+tQ@mail.gmail.com>
Subject: 10.2 firmware going out for lunch with 11a/11bg iperf tests
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hiya,

I've been porting ath10k to freebsd. I have it up and running, but
only in 11abg mode - once that's stable, I plan on doing 11n, then
11ac.

So, I hit a fun roadblock. If I do an iperf test (TCP or UDP TX) then
the firmware/NIC goes out to lunch. It's not a target assert with a
firmware dump - the whole NIC detaches from the PCI bus. I have to
completely reprobe everything from scratch to get it back alive.

I've also verified this on linux-4.4 w/ firmware 10.2.4.70.9-2 and the
latest 10.2.4 drop in Kalle's branch. If I configure it up in STA mode
and have it associate to an 11a AP, the firmware/NIC goes to lunch
pretty quickly and reproducably.

Amusingly, Ben's CT firmware doesn't have the bug - it looks like he
fixed it in a commit. I tested stock 10.1 from kalle's tree and an
early 10.1 CT firmware and both died the same way.

Are any QCA devs out there? I believe Ben and I have a fix for you,
but I can't build/test 10.2 firmware. :(

Thanks!



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
