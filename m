Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRze5-0006C9-1r
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 07:50:09 +0000
Received: by mail-vc0-f170.google.com with SMTP id hu19so5412998vcb.1
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 00:49:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395441560-6028-1-git-send-email-greearb@candelatech.com>
References: <1395441560-6028-1-git-send-email-greearb@candelatech.com>
Date: Mon, 24 Mar 2014 15:49:44 +0800
Message-ID: <CAEFj985_eDiVj2eeJeH0a6o0a0pTrO1NAsL457w82fL5HYW9Fw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add the Rx rate in FW stats
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -                       tmp += sizeof(struct wmi_peer_stats);
> +                       if (test_bit(ATH10K_FW_FEATURE_WMI_10X,
> +                                    ar->fw_features)) {
> +                               s->peer_rx_rate =
> +                                       __le32_to_cpu(peer_stats->peer_rx_rate);
> +                               tmp += sizeof(struct wmi_peer_stats_10x);
> +

Oops, additional space.

Tested and working for me.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
