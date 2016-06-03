Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8rga-00059r-Q1
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 16:11:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: remove 10.1 firmware support
Date: Fri, 3 Jun 2016 16:09:55 +0000
Message-ID: <87shwuuuct.fsf@kamboji.qca.qualcomm.com>
References: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
 <20160603153328.11947-2-rmanohar@qti.qualcomm.com>
 <5751A6D5.7080901@candelatech.com>
 <743182bcbd1efbdb576bcc51b0215300@codeaurora.org>
In-Reply-To: <743182bcbd1efbdb576bcc51b0215300@codeaurora.org> (Rajkumar
 Manoharan's message of "Fri, 03 Jun 2016 21:25:00 +0530")
Content-Language: en-US
Content-ID: <749DDE26249AFF468266A39F87806B63@qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> On 2016-06-03 21:18, Ben Greear wrote:
>> On 06/03/2016 08:33 AM, Rajkumar Manoharan wrote:
>>> Earlier qca9888 device was brought up using 10.1 firmware and then
>>> later all firmware fixes and new features are migrated to 10.2/10.2.x
>>> firmware branch. As all of 10.1 funtionalities are supported in 10.2
>>> based firmware, removing 10.1 firmware support for qca9888 device.
>>
>> Oh please do not do this.  My 10.1 firmware works very nicely,
>> and out-performs 10.2 in my testing.  Lots of people use my firmware
>> when they need IBSS support or other features not found in
>> official firmware, so it is not just me that will have
>> problems if you remove this support.
>>
> Aah.. I thought CT firmware is 10.2 based. Since most of firmware bug
> fixes and enhancements are integrated into 10.2 based firmware, we
> thought of get rid of 10.1 firmware to reduce code size. Moreover
> existing 10.1 official firmware has known issues.

Yeah, we really want to reduce the amount firmware branches to support
in ath10k.

> Is it possible to upgrade CT firmware to 10.2 WMI/HTT interfaces?

That's a good idea. That shouldn't be too hard, right? I don't think HTT needs
any changes, but for WMI few commands and ids need to be changed.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
