Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePbTw-0003Uc-NS
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 21:55:58 +0000
Received: by mail-wr0-x22a.google.com with SMTP id g53so6413726wra.2
 for <ath10k@lists.infradead.org>; Thu, 14 Dec 2017 13:55:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <007de27f-61cc-b27a-2049-e466d572b264@qti.qualcomm.com>
References: <2025478478.2725588.1512857709726.ref@mail.yahoo.com>
 <2025478478.2725588.1512857709726@mail.yahoo.com> <4122842.1D0mIpT2Ae@uapou>
 <87bmj1moxc.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmokFG2JX=dfrrKz25WermY_EaWr2HLJiU7U+WMqEuT1YoA@mail.gmail.com>
 <007de27f-61cc-b27a-2049-e466d572b264@qti.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 14 Dec 2017 13:55:33 -0800
Message-ID: <CAJ-VmokZHO6L1qN_jM0JiMNrsxudTbERZcwjAJb68xkyksa+EA@mail.gmail.com>
Subject: Re: "htt version request timed out" with the last 4.1.1.c1 firmware
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Paul Nuville <paulnuville@yahoo.fr>

Hi,

* QSDK 4.0.8 doesn't run with QCA6174 - HTT timeout as above
* QSDK ILQ 1.1.8 runs with QCA6174
* The HTT debugging shows that after the HTC/HTT stuff is setup, none
of the HTT "i'm awake" messages are coming back.

I'll try the latest firmware and board data from Kalle's repository
and see if that makes a difference. Right now I'm about 2/3rds the way
through undoing the 1.1.8 -> 4.0.8 changes in ath10k to see if I can
narrow down the actual regression.




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
