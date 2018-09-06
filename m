Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxw0K-0004Vw-Fg
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 15:15:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 0/3] support ftm responder configuration/statistics
References: <1536195700-1351-1-git-send-email-pradeepc@codeaurora.org>
 <1536215640.4015.0.camel@sipsolutions.net>
Date: Thu, 06 Sep 2018 18:15:17 +0300
In-Reply-To: <1536215640.4015.0.camel@sipsolutions.net> (Johannes Berg's
 message of "Thu, 06 Sep 2018 08:34:00 +0200")
Message-ID: <877ejy7j3u.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, david.spinadel@intel.com, ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2018-09-05 at 18:01 -0700, Pradeep Kumar Chitrapu wrote:
>> Currently ftm_responder parameter in hostapd.conf is only used for fine
>> timing measurement (FTM) capability advertisement and actual control of
>> the functionality is with low-level device/driver. This leads to confusion
>> to the user when the capability advertisement is different from actual FTM
>> responder functionality.
>> 
>> For example, FTM responder capability advertisement is set to 'enabled',
>> but the functionality is disabled or not supported by the driver.
>> 
>> The patch set allows userspace to enable FTM responder functionality
>> with the addition of new Netlink flag attribute NL80211_ATTR_FTM_RESPONDER
>> with configurable lci/civic ocation parameters. Also extended feature flag
>> is added for the drivers to advertise the support. Setting the flag to
>> enable FTM responder would imply that AP responds to all FTM requests.
>> Default is considered to be disabled.
>> 
>> changes in V3:
>>  - fixed the ambiguous ftm responder disable case to be not supported
>
> For reasons unknown to me, this patchset made it neither to the list
> nor, consequently, patchwork. Please resend.

Actually patch 3 made it:

https://patchwork.kernel.org/patch/10590115/

But it didn't get the rest as it says "Untitled series #15763".
Patchwork was timing out for me quite heavily so in that way I'm not
surprised that patches are getting lost :(

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
