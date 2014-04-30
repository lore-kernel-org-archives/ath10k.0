Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfYCO-0001ww-4e
 for ath10k@lists.infradead.org; Wed, 30 Apr 2014 17:21:36 +0000
Message-ID: <53613105.8080301@candelatech.com>
Date: Wed, 30 Apr 2014 10:21:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Vdev map issues.
References: <53604034.1030000@candelatech.com>
 <CA+BoTQ=hFkj7BUgzK=16-yfgLrkki3ZrpC5P0A3gaWmji07y6Q@mail.gmail.com>
 <53612DAF.8070602@candelatech.com>
In-Reply-To: <53612DAF.8070602@candelatech.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 04/30/2014 10:06 AM, Ben Greear wrote:
> On 04/29/2014 11:06 PM, Michal Kazior wrote:
>> On 30 April 2014 02:13, Ben Greear <greearb@candelatech.com> wrote:
>>> Possibly I've made too many local changes and gotten confused, but this code
>>> appears like it should be doing an |= instead of &= in ath10k_add_interface?
>>>
>>> err_vdev_delete:
>>>         ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
>>>         ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
>>>         list_del(&arvif->list);
>>
>> Correct. Will you submit a patch?
> 
> This is tangled in another patch that enables 64-bit vdev-maps,
> but I will rebase and post it shortly.
> 
> Another question in the related code:  For monitor devices, we
> are using bit - 1 for the monitor device ID, but we do not subtract
> one when creating normal stations.  Is this on purpose?

Ahh, nevermind that bit - 1 question, that is a local bug I introduced I think...

Thanks,
Ben

> 
> And, instead of checking for bit == 0, why not check for
> zero map before we even try the ffs call?  That should work
> for __ffs64 as well, which is what I need for lots of vdevs...
> 
> Thanks,
> Ben
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
