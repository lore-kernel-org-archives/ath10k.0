Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fq7RG-0004hi-Uy
 for ath10k@lists.infradead.org; Thu, 16 Aug 2018 01:51:04 +0000
MIME-Version: 1.0
Date: Wed, 15 Aug 2018 18:50:52 -0700
From: pradeepc@codeaurora.org
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
In-Reply-To: <1534323867.3547.30.camel@sipsolutions.net>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534323867.3547.30.camel@sipsolutions.net>
Message-ID: <4aaa3a6185dbd116ba5c1a2ce76b691f@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-08-15 02:04, Johannes Berg wrote:
> On Tue, 2018-08-14 at 17:30 -0700, Pradeep Kumar Chitrapu wrote:
>> Currently ftm_responder parameter in hostapd.conf is only used for 
>> fine
>> timing measurement (FTM) capability advertisement and actual control 
>> of
>> the functionality is with low-level device/driver. This leads to 
>> confusion
>> to the user when the capability advertisement is different from actual 
>> FTM
>> responder functionality.
>> 
>> For example, FTM responder capability advertisement is set to 
>> 'disabled',
>> which would imply that AP must not respond to FTM requests, but user 
>> sees
>> AP still responding to FTM requests, as the functionality is enabled 
>> in
>> the driver.
> 
Hi Johannes,
Thanks for the review..

> All you describe above is really a driver bug - it shouldn't have
> enabled it to start with?

Sure.. But isn't it justifiable for drivers/firmware choosing to enable
ftm responder by default when there is no way for userspace to specify 
this
parameter?

> 
>> The patch set allows userspace to configure FTM responder 
>> functionality
>> with the addition of new Netlink attribute NL80211_ATTR_FTM_RESPONDER
>> and also adds extended feature flag for the drivers to advertise the
>> support. Sending '0' to disable FTM responder would imply AP does not
>> respond to FTM requests and sending '1' to enable FTM responder would
>> imply that AP responds to all FTM requests.
> 
> This makes sense anyway. Funny you should post this within hours of me
> doing the same, basically.
Sorry, I missed your patches before posting mine :)

> 
> I have no objection to your approach, though I guess it'd be nice if 
> you
> could take a look at the statistics I have exposed and see if those
> makes sense or if additional ones are desirable for you, and then we 
> can
> combine the work that way, i.e. have your configuration and our stats?

I looked at the patch you posted and this makes sense. I will try to 
align
ath10k driver changes with your approach.

Thanks
Pradeep
> 
> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
