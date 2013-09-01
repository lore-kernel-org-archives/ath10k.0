Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG0wf-0007Bw-Co
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 06:15:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Crash when loading module
References: <201308311731.26207.chunkeey@googlemail.com>
Date: Sun, 1 Sep 2013 09:15:06 +0300
In-Reply-To: <201308311731.26207.chunkeey@googlemail.com> (Christian
 Lamparter's message of "Sat, 31 Aug 2013 17:31:25 +0200")
Message-ID: <87d2ot83v9.fsf@kamboji.qca.qualcomm.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: ath10k@lists.infradead.org

Christian Lamparter <chunkeey@googlemail.com> writes:

>> Found a way now:
>>
>> http://lists.infradead.org/pipermail/ath10k/2013-August/000279.html
>>
>> Zaki, I would appreciate if you could test that patch and see if ath10k
>> still crashes (it shouldn't). And if you want to provide your full name
>> I can add your name to the Reported-by tag.
>
> I get this before it crashes now. (This is a QCA-9880-AR1A from TP-Link Archer C7)
>
> [  271.140000] ath10k: Warning: chip id 0x043200ff is not known, expect problems
>
> Could it be, that this is just a typo, or are there several v1.0 chip_ids?

I found out (after I sent the patch) that the chip id actually contains
more than just the hardware revision. So when testing for hard revision
(hw1.0 vs hw2.0) we need to do:

(chip_id & 0xf00) >> 8

0x2 will be hw2.0 and 0x0 will be hw1.0. This seems to match with the
chip ids my boards have and also you what you have. I'll send a v2,
thanks for the feedback.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
