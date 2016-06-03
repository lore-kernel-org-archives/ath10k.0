Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8rqI-0007oS-OI
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 16:21:03 +0000
Subject: Re: [PATCH 2/2] ath10k: remove 10.1 firmware support
References: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
 <20160603153328.11947-2-rmanohar@qti.qualcomm.com>
 <5751A6D5.7080901@candelatech.com>
 <743182bcbd1efbdb576bcc51b0215300@codeaurora.org>
 <87shwuuuct.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5751AE44.8050607@candelatech.com>
Date: Fri, 3 Jun 2016 09:20:20 -0700
MIME-Version: 1.0
In-Reply-To: <87shwuuuct.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 06/03/2016 09:09 AM, Valo, Kalle wrote:
> Rajkumar Manoharan <rmanohar@codeaurora.org> writes:
>
>> On 2016-06-03 21:18, Ben Greear wrote:
>>> On 06/03/2016 08:33 AM, Rajkumar Manoharan wrote:
>>>> Earlier qca9888 device was brought up using 10.1 firmware and then
>>>> later all firmware fixes and new features are migrated to 10.2/10.2.x
>>>> firmware branch. As all of 10.1 funtionalities are supported in 10.2
>>>> based firmware, removing 10.1 firmware support for qca9888 device.
>>>
>>> Oh please do not do this.  My 10.1 firmware works very nicely,
>>> and out-performs 10.2 in my testing.  Lots of people use my firmware
>>> when they need IBSS support or other features not found in
>>> official firmware, so it is not just me that will have
>>> problems if you remove this support.
>>>
>> Aah.. I thought CT firmware is 10.2 based. Since most of firmware bug
>> fixes and enhancements are integrated into 10.2 based firmware, we
>> thought of get rid of 10.1 firmware to reduce code size. Moreover
>> existing 10.1 official firmware has known issues.
>
> Yeah, we really want to reduce the amount firmware branches to support
> in ath10k.
>
>> Is it possible to upgrade CT firmware to 10.2 WMI/HTT interfaces?
>
> That's a good idea. That shouldn't be too hard, right? I don't think HTT needs
> any changes, but for WMI few commands and ids need to be changed.

I was thinking the 10.2 mgt-over-htt API would be trouble-some to make work on
10.1 firmware.  I have my own way to do mgt-over-htt in 10.1, but API
is different and I would need a small driver patch upstream
to make that work.  I'm not sure what other changes would be needed, but
if it is just conditionally compiling some WMI defines, that should be
doable.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
