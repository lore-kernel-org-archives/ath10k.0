Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8YTf-0005OF-Di
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 21:49:37 +0000
Received: by mail-wr0-x241.google.com with SMTP id d1so39422196wrj.13
 for <ath10k@lists.infradead.org>; Tue, 17 Apr 2018 14:49:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] ath10k: support MAC address randomization in scan
References: <1522379640-6442-1-git-send-email-cjhuang@codeaurora.org>
 <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
 <20180412205954.GA34456@rodete-desktop-imager.corp.google.com>
 <e16557d0891352ae0b83902faee97023@codeaurora.org>
 <877epbs5v7.fsf@kamboji.qca.qualcomm.com> <5AD11D7C.1030603@broadcom.com>
 <242be71eb87140c9560163c4000255b2@codeaurora.org>
 <8736zvqtcw.fsf@kamboji.qca.qualcomm.com>
 <20180417002854.GA186697@rodete-desktop-imager.corp.google.com>
 <5AD5AEB5.1040808@broadcom.com>
 <20180417160715.GA255263@rodete-desktop-imager.corp.google.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5AD66BD9.4000706@broadcom.com>
Date: Tue, 17 Apr 2018 23:49:13 +0200
MIME-Version: 1.0
In-Reply-To: <20180417160715.GA255263@rodete-desktop-imager.corp.google.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 4/17/2018 6:07 PM, Brian Norris wrote:
> On Tue, Apr 17, 2018 at 10:22:13AM +0200, Arend van Spriel wrote:
>> On 4/17/2018 2:28 AM, Brian Norris wrote:
>>> It looks like the status quo for looking for SCHED_SCAN support is to
>>> check if NL80211_CMD_START_SCHED_SCAN shows up in the command support
>>> list. (IOW, that's what wpa_supplicant does.) We'll probably need to
>>> imitate that.
>>
>> I believe checking command support is not really recommended. Instead, you
>> better check NL80211_ATTR_SCHED_SCAN_MAX_REQS being non-zero (since kernel
>> 4.12 that is).
>
> Why not? Command support checking is what wpa_supplicant is doing.

That's not really a good argument. A couple (or more) years ago 
wpa_supplicant was not doing nl80211 but wext and some other using 
driver private ioctls, but that did not make it the best approach.

The START_SCHED_SCAN command is indeed still provided to user-space:

@@ -1376,7 +1377,7 @@ static int nl80211_add_commands_unsplit(struct 
cfg80211_r
                 CMD(tdls_mgmt, TDLS_MGMT);
                 CMD(tdls_oper, TDLS_OPER);
         }
-       if (rdev->wiphy.flags & WIPHY_FLAG_SUPPORTS_SCHED_SCAN)
+       if (rdev->wiphy.max_sched_scan_reqs)
                 CMD(sched_scan_start, START_SCHED_SCAN);
         CMD(probe_client, PROBE_CLIENT);
         CMD(set_noack_map, SET_NOACK_MAP);

It was left in because existing user-space apps might depend on it.

> I noticed NL80211_ATTR_SCHED_SCAN_MAX_REQS, but unfortunately, we have
> to support older kernels. It looks like randomization was added in
> v3.19, and as you point out, that's only available in v4.12.

I figured that would be the issue so I dug up the kernel version.

> I welcome other alternatives if you have them to offer.

Nope. Not if you want to be kernel version agnostic.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
