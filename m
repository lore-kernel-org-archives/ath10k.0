Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKqMW-000562-Oj
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 19:53:09 +0000
MIME-Version: 1.0
Date: Thu, 08 Nov 2018 11:52:53 -0800
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
In-Reply-To: <CA+ASDXOqJ1-G2amyu7sJCnzKf1oY_2j9Qw4WS0VTf8EqGr6Uqw@mail.gmail.com>
References: <20181107185643.240346-1-briannorris@chromium.org>
 <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
 <b1a64bd66fa25f274af8c018c6fc02f4@codeaurora.org>
 <CA+ASDXOqJ1-G2amyu7sJCnzKf1oY_2j9Qw4WS0VTf8EqGr6Uqw@mail.gmail.com>
Message-ID: <f1abeef79b579f91850cab298a32fe00@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: yyuwang@codeaurora.org, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, govinds@codeaurora.org, pillair@codeaurora.org, stable <stable@vger.kernel.org>

On 2018-11-08 09:30, Brian Norris wrote:
> On Wed, Nov 7, 2018 at 8:32 PM Govind Singh <govinds@codeaurora.org> 
> wrote:
>> On 2018-11-08 03:00, Rajkumar Manoharan wrote:
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

I meant that the revert commit remove quiet mode support from QCA6174 & 
QCA9377.

>> This regression is found while we switched from 4.18 + WCN3990
>> back-ports to 4.19.
> 
> ^^ What Govind said. WCN3990 support has been trickling in over a few
> releases, and it doesn't seem kosher to allow people to submit
> regressions in the midst of that.
> 
Nobody prefers regression :). WCN3990 support was still in progress, at
the time the commit got merged into upstream. My point is that we can't 
expect
the community to validate the changes against in-progress platform.

>> 
>> IMO, we should use (WMI_SERVICE_THERMAL_MGMT | WMI_SERVICE_THERM_THROT 
>> )
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
That is true. Any new features or interface changes in firmware will be
advertised by feature bit. But the quiet param was available in firmware
since first release.

> Of course, I'll leave it up to Kalle as to how he wants to mediate
> this. And if you come up with a solid patch soon that can fix this
> without dropping the feature, then so be it.
> 
Govind is working on to handle this properly either by instantiating
new WMI-TLV table for WCNxxxx or by adding conditional check in exiting 
path.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
