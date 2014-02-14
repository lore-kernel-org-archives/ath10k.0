Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE806-0003eM-53
 for ath10k@lists.infradead.org; Fri, 14 Feb 2014 01:55:34 +0000
Received: by mail-ve0-f182.google.com with SMTP id jy13so9141391veb.41
 for <ath10k@lists.infradead.org>; Thu, 13 Feb 2014 17:55:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87r4767rmo.fsf@kamboji.qca.qualcomm.com>
References: <1392197844-1223-1-git-send-email-yeohchunyeow@gmail.com>
 <87r4767rmo.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 14 Feb 2014 09:55:11 +0800
Message-ID: <CAEFj986=ABAqRYXcL9_Ov8MkHVfjOnc=y9nx65hFXbBcH61WyQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement drv_get_tsf for ibss merging
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Yeah, this extremely ugly but don't really know any better way to handle
> this now.

I have observed that we have ath10k_wmi_event_tsf_measurement_report,
but no so sure how to trigger this event.

> But why do you need to take conf_mutex? Isn't this enough:
>
> +static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
> +{
> +       /*
> +        * FIXME: Return 0 for time being. Need to figure out whether FW
> +        * has the API to fetch 64-bit TSF
> +        */
> +
> +       return 0;
> +}

Ya, I think this is enough for time being. I will submit v2 on this.

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
