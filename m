Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXEN-0003Nu-MX
 for ath10k@lists.infradead.org; Mon, 04 May 2020 09:17:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] Allow qca988x family to support ack rssi of tx data
 packets.
References: <20200312082047.487DAC433D2@smtp.codeaurora.org>
 <9827dda3-7a4a-5e10-071a-c7b4e4044572@gmail.com>
 <87y2qde08w.fsf@kamboji.qca.qualcomm.com>
 <6355ca22-f09a-5091-fc52-7a7e8f554323@gmail.com>
Date: Mon, 04 May 2020 12:17:38 +0300
In-Reply-To: <6355ca22-f09a-5091-fc52-7a7e8f554323@gmail.com> (John Deere's
 message of "Thu, 30 Apr 2020 22:16:59 +0800")
Message-ID: <87pnbkdpot.fsf@kamboji.qca.qualcomm.com>
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
To: John Deere <24601deerej@gmail.com>
Cc: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org

(Fixing top posting and adding Yibo)

John Deere <24601deerej@gmail.com> writes:

> On 4/30/20 6:28 PM, Kalle Valo wrote:
>> John Deere <24601deerej@gmail.com> writes:
>>
>>> Hello,
>>>
>>>> Firmwares tested : 10.4-3.9.0.1-00036
>>>
>>> The firmware above is unavailable anywhere.
>>
>> It's here:
>>
>> https://github.com/kvalo/ath10k-firmware/blob/master/QCA9984/hw1.0/3.9.0.1/firmware-5.bin_10.4-3.9.0.1-00036
>
> That is for the QCA9884, not the QCA9887 as listed in the hardware tested.

Good point, I missed that. Thanks for pointing it out.

So we are talking about this commit:

commit 5637c4ca961bc72ae3cce4bd5cbcecb5b8e32a54
Author:     Yibo Zhao <yiboz@codeaurora.org>
AuthorDate: Wed Mar 11 19:23:29 2020 +0200
Commit:     Kalle Valo <kvalo@codeaurora.org>
CommitDate: Thu Mar 12 10:20:02 2020 +0200

    ath10k: allow qca988x family to support ack rssi of tx data packets.
    
    Hardwares tested : QCA9887
    Firmwares tested : 10.4-3.9.0.1-00036
    
    Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
    Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Yibo, we don't have 10.4 firmware for QCA9887 so the commit log doesn't
make sense. How did you test this on QCA9887?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
