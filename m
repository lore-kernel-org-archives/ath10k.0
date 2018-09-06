Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxnry-0003kM-CN
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 06:34:24 +0000
Message-ID: <1536215640.4015.0.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/3] support ftm responder configuration/statistics
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 06 Sep 2018 08:34:00 +0200
In-Reply-To: <1536195700-1351-1-git-send-email-pradeepc@codeaurora.org>
References: <1536195700-1351-1-git-send-email-pradeepc@codeaurora.org>
Mime-Version: 1.0
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, david.spinadel@intel.com

On Wed, 2018-09-05 at 18:01 -0700, Pradeep Kumar Chitrapu wrote:
> Currently ftm_responder parameter in hostapd.conf is only used for fine
> timing measurement (FTM) capability advertisement and actual control of
> the functionality is with low-level device/driver. This leads to confusion
> to the user when the capability advertisement is different from actual FTM
> responder functionality.
> 
> For example, FTM responder capability advertisement is set to 'enabled',
> but the functionality is disabled or not supported by the driver.
> 
> The patch set allows userspace to enable FTM responder functionality
> with the addition of new Netlink flag attribute NL80211_ATTR_FTM_RESPONDER
> with configurable lci/civic ocation parameters. Also extended feature flag
> is added for the drivers to advertise the support. Setting the flag to
> enable FTM responder would imply that AP responds to all FTM requests.
> Default is considered to be disabled.
> 
> changes in V3:
>  - fixed the ambiguous ftm responder disable case to be not supported

For reasons unknown to me, this patchset made it neither to the list
nor, consequently, patchwork. Please resend.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
