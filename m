Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fq7Op-0002wM-3r
 for ath10k@lists.infradead.org; Thu, 16 Aug 2018 01:48:33 +0000
MIME-Version: 1.0
Date: Wed, 15 Aug 2018 18:48:18 -0700
From: pradeepc@codeaurora.org
Subject: Re: [PATCH 1/3] nl80211: add support to configure FTM responder
 functionality
In-Reply-To: <1534334948.3547.39.camel@sipsolutions.net>
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-2-git-send-email-pradeepc@codeaurora.org>
 <1534334948.3547.39.camel@sipsolutions.net>
Message-ID: <15c381ce743aedca37f3eea67975f841@codeaurora.org>
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

On 2018-08-15 05:09, Johannes Berg wrote:
> On Tue, 2018-08-14 at 17:30 -0700, Pradeep Kumar Chitrapu wrote:
>> 
>> +	int ftm_responder;
> 
> bool
> 
>> + * @NL80211_ATTR_FTM_RESPONDER: attribute which user-space can 
>> include in
>> + *	%NL80211_CMD_START_AP to enable(1) or disable(0) fine timing 
>> measurement
>> + *	(FTM) responder functionality.  If not set, it means don't care 
>> and
>> + *	the device will decide what to use.
> 
> Why 0/1 instead of a flag attribute?
Using FLAG attribute may create uncertainty to userspace especially when 
flag attribute
is not set and the driver supports capability, instead of 
assuming/relying on the default
behavior of driver/firmware.

> 
> Also, I think you need the attributes (LCI/Civic location)?
> 
> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
