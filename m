Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEa1v-0001Ho-56
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 11:04:55 +0000
MIME-Version: 1.0
Date: Wed, 07 Dec 2016 16:34:33 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH 1/4] cfg80211: Add support to enable or disable btcoex
In-Reply-To: <1480949161.31788.23.camel@sipsolutions.net>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-2-git-send-email-c_traja@qti.qualcomm.com>
 <1480949161.31788.23.camel@sipsolutions.net>
Message-ID: <576b59d939ecd1296b8550de2e63052d@codeaurora.org>
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
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Johannes,

Thanks for the comments.

On 2016-12-05 20:16, Johannes Berg wrote:
> On Tue, 2016-11-08 at 18:45 +0530, c_traja@qti.qualcomm.com wrote:
>> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>> 
>> This patch adds support to enable or disable btcoex by
>> adding NL80211_ATTR_WIPHY_BTCOEX_ENABLE attribute in
>> NL80211_CMD_SET_WIPHY command. By default BTCOEX disabled in driver.
> 
> I think overloading SET_WIPHY even more is a mistake - why not group
> this with the new command you're introducing in the second patch?
> 
Sure.

> Also, can have a flag attribute to enable/disable, or better even
> disable when you're not setting any other parameters.

BTCOEX will be disabled by default. I will use 
NL80211_ATTR_WIPHY_BTCOEX_ENABLE
attribute to enable/disable BTCOEX.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
