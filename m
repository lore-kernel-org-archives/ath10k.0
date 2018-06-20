Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVi9R-0006l3-A4
 for ath10k@lists.infradead.org; Wed, 20 Jun 2018 18:48:24 +0000
MIME-Version: 1.0
Date: Wed, 20 Jun 2018 11:48:03 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] ath10k: Don't allow tx logic when state is not ON.
In-Reply-To: <3dc5dce6-a8ef-93f6-318f-6ca2e62f8853@candelatech.com>
References: <1529506583-20204-1-git-send-email-greearb@candelatech.com>
 <9ba64928-a73b-0fe6-9586-65929ca87013@codeaurora.org>
 <3dc5dce6-a8ef-93f6-318f-6ca2e62f8853@candelatech.com>
Message-ID: <a6bbeef21bb377e1480ca99f4d2c1013@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless-owner@vger.kernel.org, Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

On 2018-06-20 10:42, Ben Greear wrote:
> On 06/20/2018 10:37 AM, Manikanta Pubbisetty wrote:
>> 
[...]
>> This case should not be dealt in ath10k, rather we should make sure 
>> packets does not reach the driver during hardware restart after the 
>> firmware crash.
>> Can you please try the RFC patch and see if it fixes the issue? I am 
>> working on the patch and probably send it out after doing some testing 
>> and cleanup.
>> 
>> https://patchwork.kernel.org/patch/10411967/
> 
> I did see your patch, but I was not sure it would make it upstream.
> 
> I think either way my patch might be useful in case bugs creep back in.
> 

ar->state check can not be in hot path as it is protected by mutex lock.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
