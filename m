Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Z5B-000830-Ca
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 12:21:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Yesterdays kernel/git/kvalo/ath.git failes with COMPEX WLE600VX
References: <87a8q8uco7.fsf@kamboji.qca.qualcomm.com>
 <1137895868.8098680.1448026264465.JavaMail.yahoo@mail.yahoo.com>
Date: Wed, 25 Nov 2015 14:21:19 +0200
In-Reply-To: <1137895868.8098680.1448026264465.JavaMail.yahoo@mail.yahoo.com>
 (Joerg Pommnitz's message of "Fri, 20 Nov 2015 13:31:04 +0000 (UTC)")
Message-ID: <87fuzunubk.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Joerg Pommnitz <pommnitz@yahoo.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Joerg Pommnitz <pommnitz@yahoo.com> writes:

> Kalle, attached are dmesg logs from 3.18.24 and your git tree. The
> patch from your mail is _NOT_ yet applied.

Thanks. So the ath10k board is on slot 0000:05:00.0. In 4.3 log I saw
this warning:

[    0.488080] pci 0000:05:00.0: can't claim BAR 0 [mem
0xe8000000-0xe81fffff 64bit]: address conflict with PCI Bus 0000:01
[mem 0xe8000000-0xe85fffff]

Also the BAR configurations look different, 3.18 has:

[    0.596024] pci 0000:05:00.0: BAR 6: assigned [mem 0xe8200000-0xe820ffff pref]

but 4.3 has:

[    0.660123] pci 0000:05:00.0: BAR 0: assigned [mem 0x48400000-0x485fffff 64bit]
[    0.664037] pci 0000:05:00.0: BAR 6: assigned [mem 0x48290000-0x4829ffff pref]

The chances are that this has something to do with your problem. Also in
a private email[1] you mentioned that latest ath10k works with 3.18
kernel, right? This makes me suspect that this is a problem outside
ath10k, but I'm not a PCI bus expert so I'm not really sure.

I recommend that next you try other major kernel versions (3.19, 4.0,
4.1 and so on) and find out what release first introduced the
regression. Remember always to take full dmesg logs like you have done
now. And once you have that send a mail to proper lists asking for help,
for example at least linux-wireless and linux-pci. But please continue
to CC ath10k list also, it's interesting to know what is causing this.

And even better is that if you can run full bisect to find the offending
commit, but that takes a quite long time.

> BTW, patch gives an offset of 99 lines when applying to your git tree.
> Is this relative to a branch?

The patch was few weeks old, I haven't rebased it since so that's
normal. I just hope it applied to the change to the correct location.

[1] Please do not send private email, the discussions should happen on
the list.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
