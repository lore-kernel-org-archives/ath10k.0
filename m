Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSjf4-0006ys-9L
 for ath10k@lists.infradead.org; Tue, 03 Mar 2015 10:02:47 +0000
Received: by lbiz11 with SMTP id z11so10003300lbi.13
 for <ath10k@lists.infradead.org>; Tue, 03 Mar 2015 02:02:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425374299.2450.18.camel@sipsolutions.net>
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
 <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 <1425374299.2450.18.camel@sipsolutions.net>
From: Arik Nemtsov <arik@wizery.com>
Date: Tue, 3 Mar 2015 12:02:05 +0200
Message-ID: <CA+XVXffHENxD3z9dTn_LC9c7Ot0Q4FgyEoHLjdeiDTFWQGuF9w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for tdls
 station
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Arik Nemtsov <arikx.nemtsov@intel.com>

On Tue, Mar 3, 2015 at 11:18 AM, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Sun, 2015-03-01 at 10:21 +0200, Arik Nemtsov wrote:
>
>> > Arik, you have a similar patch handling only NSS. Does this one look
>> > fine to you, and would it solve the problem your other patch solved?
>>
>> Well currently iwlmvm requires the NSS to be set before
>> IEEE80211_STA_ASSOC (earlier), so this doesn't help directly.
>> I could change mvm a bit to make it work, but I don't really see a
>> good reason for it :)
>>
>> The patch looks good. Shouldn't introduce new issues (at least for iwlwifi).
>
> Ok, thanks. Do you think it would be possible to move all of this before
> ASSOC?

We can probably move his rate_control_rate_init() to assoc, since we have this:

/*
* TDLS -- everything follows authorized, but
* only becoming authorized is possible, not
* going back
*/
if (set & BIT(NL80211_STA_FLAG_AUTHORIZED)) {
set |= BIT(NL80211_STA_FLAG_AUTHENTICATED) |
      BIT(NL80211_STA_FLAG_ASSOCIATED);
mask |= BIT(NL80211_STA_FLAG_AUTHENTICATED) |
BIT(NL80211_STA_FLAG_ASSOCIATED);
}

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
