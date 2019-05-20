Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSimd-0007Ra-IK
 for ath10k@lists.infradead.org; Mon, 20 May 2019 13:56:56 +0000
MIME-Version: 1.0
Date: Mon, 20 May 2019 21:56:52 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: remove warning message
In-Reply-To: <ea87337c24666355059488b42d97ee22711ce7b8.camel@sipsolutions.net>
References: <1557824507-17668-1-git-send-email-yiboz@codeaurora.org>
 <7c92f5cf51eaec1d5449698d90f5b6c5ca6c2bea.camel@sipsolutions.net>
 <ccb48284f0d96e72f4c041e12c943f0a@codeaurora.org>
 <e2a6596b99085541a5886c0d0d6393c849ac2d57.camel@sipsolutions.net>
 <34f72d5db336b9898618bf1c5c15ec41094d7d06.camel@perches.com>
 <4d013893-3302-14f0-c957-b3771f4b6b82@candelatech.com>
 <8eacb8e107c854b64a0c6116fca9731ddd99dcac.camel@sipsolutions.net>
 <730d3664-488d-7d57-04d5-1a57e91fa070@candelatech.com>
 <ea87337c24666355059488b42d97ee22711ce7b8.camel@sipsolutions.net>
Message-ID: <bbfd69ccb4289ba3f1767c1066f61ee1@codeaurora.org>
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
Cc: Zhi Chen <zhichen@codeaurora.org>, Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-05-15 02:57, Johannes Berg wrote:
> On Tue, 2019-05-14 at 11:54 -0700, Ben Greear wrote:
>> 
>> Here is the info I have in my commit that changed this to 
>> WARN_ON_ONCE.
>> I never posted it because I had to hack ath10k to get to this state, 
>> so maybe
>> this is not a valid case to debug.
>> 
>> 
>> Maybe Yibo Zhao has a better example.
>> 
>>      mac80211: don't spam kernel logs when chantx is null.
>> 
>>      I set up ath10k to be chandef based again in order to test
>>      WDS.  My WDS stations are not very functional yet, and
>>      when ethtool stats are queried, there is a WARN_ON splat
>>      generated.  Change this to WARN_ON_ONCE so that there is
>>      less kernel spam.
> 
> I'm totally fine with WARN_ON_ONCE, FWIW.
> 
> Sounds like different bugs though. You're talking about WDS here, and
> Yibo was talking about something with AP interfaces prematurely
> accepting frames or so.

Yes, they might be different bugs that hit the same point. Looks like 
others found this too many warnings issue as well. Then I believe 
WARN_ON_ONCE() seems to be our solution for now.

> 
> johannes

-- 
Yibo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
