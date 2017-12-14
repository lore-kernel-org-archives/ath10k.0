Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePaz1-00038r-If
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 21:24:01 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: "htt version request timed out" with the last 4.1.1.c1 firmware
Date: Thu, 14 Dec 2017 21:22:34 +0000
Message-ID: <007de27f-61cc-b27a-2049-e466d572b264@qti.qualcomm.com>
References: <2025478478.2725588.1512857709726.ref@mail.yahoo.com>
 <2025478478.2725588.1512857709726@mail.yahoo.com> <4122842.1D0mIpT2Ae@uapou>
 <87bmj1moxc.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmokFG2JX=dfrrKz25WermY_EaWr2HLJiU7U+WMqEuT1YoA@mail.gmail.com>
In-Reply-To: <CAJ-VmokFG2JX=dfrrKz25WermY_EaWr2HLJiU7U+WMqEuT1YoA@mail.gmail.com>
Content-Language: en-US
Content-ID: <3ED7641FBBAD8E4095E8F385D075AB4B@qualcomm.com>
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
To: Adrian Chadd <adrian@freebsd.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Paul Nuville <paulnuville@yahoo.fr>

On 12/14/2017 10:33 AM, Adrian Chadd wrote:

> Hi,
>
> I've had this issue with a 4.11 update from QSDK (4.0.8.) ILQ-1.1.8
> worked fine with ye olde backports.
>
> Is it really just a board-2.bin issue? I tried it and it didn't fix it.

The case Paul has seems due to the correct board file missing.
Not sure what issue you're seeing? any logs?

Also the issue is for QCA6174, does your QSDK 4.0.8 run with QCA6174?

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
