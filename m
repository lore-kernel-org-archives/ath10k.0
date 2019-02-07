Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grktK-00083D-4s
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:43:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
 <6a59f346-5c9b-190c-feef-39393d17933b@bowerswilkins.com>
Date: Thu, 07 Feb 2019 16:42:57 +0200
In-Reply-To: <6a59f346-5c9b-190c-feef-39393d17933b@bowerswilkins.com> (Peter
 Oh's message of "Tue, 11 Dec 2018 19:22:38 +0000")
Message-ID: <87lg2r8xse.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Zhi Chen <zhichen@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Peter Oh <peter.oh@bowerswilkins.com> writes:

> On 12/10/2018 08:56 PM, Pradeep Kumar Chitrapu wrote:
>> From: Pradeep kumar Chitrapu <pradeepc@codeaurora.org>
>>
>> Invalid rate code is sent to firmware when multicast rate value of 0 is
>> sent to driver indicating disabled case, causing broken mesh path.
>> so fix that.
>>
>> Tested on QCA9984 with firmware 10.4-3.6.1-00827
>>
> Test data is too small. You need to provide at least QCA9880 and QCA4019 
> data together which share ath10k for mesh.

Pradeep, did you test those? Or someone else?

But isn't the firmware almost the same on those hardware anyway?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
