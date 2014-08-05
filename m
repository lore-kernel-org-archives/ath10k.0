Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEfnD-0000op-7v
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 14:32:48 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so1118125wgh.30
 for <ath10k@lists.infradead.org>; Tue, 05 Aug 2014 07:31:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <eb55c11a30ae4d32a821d7db6b54d18f@exmbx1.ad.aau.at>
References: <9087ccfa9e9346eb808c2b0f61259744@exmbx1.ad.aau.at>
 <CA+BoTQ=VGtqKL1CBF_pAgzkdd9sKZ7Du=YfaP9MRqoDbeu5Wtg@mail.gmail.com>
 <eb55c11a30ae4d32a821d7db6b54d18f@exmbx1.ad.aau.at>
Date: Tue, 5 Aug 2014 16:31:57 +0200
Message-ID: <CACKGw+EMHNt69BG8UCp0xbdErhyOCM18qT_4B+A0=Mb0E8we3w@mail.gmail.com>
Subject: Re: ath10k with hostapd
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: "Hayat, Samira" <Samira.Hayat@aau.at>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 5 August 2014 15:47, Hayat, Samira <Samira.Hayat@aau.at> wrote:

[...]

> This is my .config file:
>
> CONFIG_DRIVER_HOSTAP=y
> CONFIG_DRIVER_NL80211=y
>
> CONFIG_IAPP=y
> CONFIG_RSN_PREAUTH=y
> CONFIG_PEERKEY=y
> CONFIG_IEEE80211W=y
> CONFIG_EAP=y
> CONFIG_EAP_MD5=y
> CONFIG_EAP_TLS=y
> CONFIG_EAP_MSCHAPV2=y
> CONFIG_EAP_PEAP=y
> CONFIG_EAP_GTC=y
> CONFIG_EAP_TTLS=y
> CONFIG_IPV6=y
>
> CONFIG_IEEE80211N=y
> CONFIG_IEEE80211AC=y
>
> CONFIG_ACS=y

Then are you sure you are executing the hostapd exec you have actually
compiled, not the distro one?

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
