Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxuVi-0001wQ-C0
 for ath10k@lists.infradead.org; Tue, 11 Apr 2017 12:03:09 +0000
Received: by mail-wm0-x22d.google.com with SMTP id o81so61405110wmb.1
 for <ath10k@lists.infradead.org>; Tue, 11 Apr 2017 05:02:40 -0700 (PDT)
Subject: Re: [PATCHv4 0/2] cfg80211: mac80211: BTCOEX feature support
References: <1491905730-16392-1-git-send-email-c_traja@qti.qualcomm.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <50d867d1-740c-85b9-2bab-6ef49c4d87c1@broadcom.com>
Date: Tue, 11 Apr 2017 14:02:37 +0200
MIME-Version: 1.0
In-Reply-To: <1491905730-16392-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org, johannes@sipsolutions.net, tamizhchelvam@codeaurora.org, Marcel Holtmann <marcel@holtmann.org>, ath10k@lists.infradead.org

+ linux-bluetooth, Marcel

On 11-4-2017 12:15, c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> This patchset add support for BTCOEX feature to enable/disable and
> modifying btcoex priority value via nl80211

So you make a distinction between WMM ACs, but what about the different
types/profiles of BT traffic?

Regards,
Arend

> Tamizh chelvam (2):
>   cfg80211: Add support to enable or disable btcoex and set
>     btcoex_priority
>   mac80211: Add support to enable or disable btcoex and set btcoex
>     priority value
> 
> v4 :
>   * Moved btcoex_priority_support_flag enum to nl80211.h and renamed it.
>   * fixed typo.
> 
> v3 :
>   * Introduced NL80211_EXT_FEATURE_BTCOEX_PRIORITY to expose
>     btcoex priority support and removed bool variable.
> 
> v2 :
>   * Introduced NL80211_CMD_SET_BTCOEX to enable/disable btcoex and
>     to set/modify btcoex_priority.
>   * Added bool variable in wiphy structure to advertise btcoex_priority
>     feature and removed BITMAP calculation for btcoex_priority value.
> 
>  include/net/cfg80211.h       |    6 +++++
>  include/net/mac80211.h       |    5 +++++
>  include/uapi/linux/nl80211.h |   50 ++++++++++++++++++++++++++++++++++++++++++
>  net/mac80211/cfg.c           |    9 ++++++++
>  net/mac80211/driver-ops.h    |   15 +++++++++++++
>  net/mac80211/trace.h         |   20 +++++++++++++++++
>  net/wireless/nl80211.c       |   45 +++++++++++++++++++++++++++++++++++++
>  net/wireless/rdev-ops.h      |   13 +++++++++++
>  net/wireless/trace.h         |   17 ++++++++++++++
>  9 files changed, 180 insertions(+)
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
