Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d17pG-0000j9-Dj
 for ath10k@lists.infradead.org; Thu, 20 Apr 2017 08:52:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: ath10k: bump up FW API to 6
Date: Thu, 20 Apr 2017 08:52:00 +0000
Message-ID: <87fuh35umo.fsf@kamboji.qca.qualcomm.com>
References: <1491944688-5795-1-git-send-email-ryanhsu@qca.qualcomm.com>
 <8a9bab5f36e8456bafa8d872012bcf3a@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <8a9bab5f36e8456bafa8d872012bcf3a@euamsexm01a.eu.qualcomm.com>
 (Kalle Valo's message of "Wed, 19 Apr 2017 16:07:07 +0200")
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> ryanhsu@qti.qualcomm.com wrote:
>> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
>> 
>> For QCA6174 hw3.0, since WLAN.RM.4.4-00022-QCARMSWPZ-2, it starts to
>> support the board ID information from otp, with some devices released on
>> the market that didn't calibrated with OTP, will have 0 for board ID
>> information, which cause the backward compatibility issue and was fixed
>> in commit 'd2e202c06ca4 ("ath10k: ignore configuring the incorrect board_id")'
>> 
>> So bump the fw api version to differentiate the latest firmware support.
>> 
>> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> aad1fd7f7677 ath10k: bump up FW API to 6

And I renamed the RM.4.4 firmware image also:

https://github.com/kvalo/ath10k-firmware/commit/da1564dafe1c8175faf694482d1649f56229ae96

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
