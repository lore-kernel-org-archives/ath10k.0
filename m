Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVMdV-0006Ui-JB
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 14:59:30 +0000
Message-ID: <533C25BB.7080803@candelatech.com>
Date: Wed, 02 Apr 2014 07:59:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove not needed warning when peer unmap
References: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
 <877g78rxv0.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <877g78rxv0.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 04/02/2014 12:31 AM, Kalle Valo wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Remove not needed warning when get peer unmap
>> event from the firmware. This is not critical
>> message. Instead print this as a debug message.
>
> I don't agree with that statement. If that would be true, we could
> remove a lot of warnings from ath10k. We have these warnings to catch
> problems early, which again improves the quality of the driver.

I see this message all the time, by the way...  I have been ignoring
it so far, but if it's  real issue then I can pay more attention.

Thanks,
Ben

>
> Your commit log was again missing the "why?" part. I assume the reason
> for this patch is the problem of seeing the warning "unknown peer id 2"
> when putting the interface is down, which again is a spurious event from
> the firmware? You should document that in the commit log as well as add
> a short comment to the code explaining why we only print a debug message
> when that happens.
>
> Other idea I had would be to keep the warning message but add a new test
> to detect this problematic case, but I guess for that we would need to
> add a new state "stopping" to catch that? For example, something like
> this:
>
> if state == stopping and event->id == 2
>          dbg("foo")
> else
>          warn("bar")
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
