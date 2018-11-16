Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNb9g-0007Cl-NX
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 10:15:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
References: <20181107185643.240346-1-briannorris@chromium.org>
 <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
 <b1a64bd66fa25f274af8c018c6fc02f4@codeaurora.org>
 <CA+ASDXOqJ1-G2amyu7sJCnzKf1oY_2j9Qw4WS0VTf8EqGr6Uqw@mail.gmail.com>
Date: Fri, 16 Nov 2018 12:14:59 +0200
In-Reply-To: <CA+ASDXOqJ1-G2amyu7sJCnzKf1oY_2j9Qw4WS0VTf8EqGr6Uqw@mail.gmail.com>
 (Brian Norris's message of "Thu, 8 Nov 2018 09:30:43 -0800")
Message-ID: <87k1ld72ho.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: yyuwang@codeaurora.org, rmanohar@codeaurora.org, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, govinds@codeaurora.org, pillair@codeaurora.org, stable <stable@vger.kernel.org>

Brian Norris <briannorris@chromium.org> writes:

> On Wed, Nov 7, 2018 at 8:32 PM Govind Singh <govinds@codeaurora.org> wrote:
>> On 2018-11-08 03:00, Rajkumar Manoharan wrote:
>> > On 2018-11-07 10:56, Brian Norris wrote:
>> >> This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
>> >>
>> >> WCN3990 firmware does not yet implement this feature, and so it
>> >> crashes
>> >> like this:
>> >>
>> >>   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN
>> >> RT:207a:PC=b001b4f0
>> >>
>> >> This feature can be re-implemented with a proper service bitmap or
>> >> other
>> >> feature-discovery mechanism in the future. But it should not break
>> >> working boards.
>> >>
>> > Brian,
>> >
>> > The change "ath10k: add quiet mode support for QCA6174/QCA9377" was
>> > merged even
>> > before full WCN3990 device support was added in ath10k. How come it
>> > could be regression
>> > for WCN3990. I know both are sharing same WMI-TLV interface but
>> > reverting this
>> > will break QCA6174/QCA9377. no?
>
> I don't see how the revert would "break" QCA6174 -- QCA6174 worked
> just fine without this feature and should continue to do so.
>
>> This regression is found while we switched from 4.18 + WCN3990
>> back-ports to 4.19.
>
> ^^ What Govind said. WCN3990 support has been trickling in over a few
> releases, and it doesn't seem kosher to allow people to submit
> regressions in the midst of that.

Yeah, I agree.

>> > I would prefer to handle this within WMI callback or upper layer.
>> >
>>
>> IMO, we should use (WMI_SERVICE_THERMAL_MGMT | WMI_SERVICE_THERM_THROT )
>> service bitmap check and call
>> ath10k_thermal_set_throttling only if fw supports THERMAL THROTTLE
>> feature. But we need to ensure all
>> available ath10k fw's are reporting this service.
>
> And the above notes from Govind highlight this -- if the feature was
> not protected by the appropriate service flags, then we can't be sure
> that you didn't break a bunch of other firmware releases out there.
> Linux should not break for everyone just because you spun a firmware
> release.
>
> Of course, I'll leave it up to Kalle as to how he wants to mediate
> this. And if you come up with a solid patch soon that can fix this
> without dropping the feature, then so be it.

We should have a fix for this available next week which I'm planning to
push to 4.20. If that does not happen my plan B is to apply Brian's
revert to make wcn3990 working on 4.20.

Thanks Brian for investigating this and providing the revert!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
