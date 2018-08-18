Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqw03-0004JC-4j
 for ath10k@lists.infradead.org; Sat, 18 Aug 2018 07:50:20 +0000
MIME-Version: 1.0
Date: Sat, 18 Aug 2018 00:50:06 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH 0/3] Add support for ftm responder configuration
In-Reply-To: <1534407150.3547.58.camel@sipsolutions.net>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534323867.3547.30.camel@sipsolutions.net>
 <4aaa3a6185dbd116ba5c1a2ce76b691f@codeaurora.org>
 <1534407150.3547.58.camel@sipsolutions.net>
Message-ID: <cd1e8ef5693b81c6b5d25eae36a44fd3@codeaurora.org>
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


> 
> No worries.
> 
>> >
>> > I have no objection to your approach, though I guess it'd be nice if
>> > you
>> > could take a look at the statistics I have exposed and see if those
>> > makes sense or if additional ones are desirable for you, and then we
>> > can combine the work that way, i.e. have your configuration and our stats?
>> 
>> I looked at the patch you posted and this makes sense. I will try to
>> align ath10k driver changes with your approach.
> 
> I tend to actually like your patch better for configuration - no new
> command, though it is, I think, lacking configuration of the necessary
> elements (where do you take the LCI/Civic location from?).
> 
> johannes

Hi Johannes,

I will change the attribute to FLAG type, also add support for LCI/CIVIC 
params
and repost the patch.

Thanks
Pradeep

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
