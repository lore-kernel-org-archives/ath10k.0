Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0061.hostedemail.com ([216.40.44.61]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqc09-0004mb-VP
 for ath10k@lists.infradead.org; Thu, 14 Apr 2016 07:47:47 +0000
Message-ID: <1460620028.19090.12.camel@perches.com>
Subject: Re: [PATCH v2 1/5] ath10k: fix checkpatch warnings related to spaces
From: Joe Perches <joe@perches.com>
Date: Thu, 14 Apr 2016 00:47:08 -0700
In-Reply-To: <20160413111320.18823.25021.stgit@potku.adurom.net>
References: <20160413111247.18823.15952.stgit@potku.adurom.net>
 <20160413111320.18823.25021.stgit@potku.adurom.net>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Wed, 2016-04-13 at 14:13 +0300, Kalle Valo wrote:
> Fix checkpatch warnings about use of spaces with operators:
> spaces preferred around that '*' (ctx:VxV)
> This has been recently added to checkpatch.

Trivia: That's not a particularly recent change.

> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless=
/ath/ath10k/wmi.h
[]
> @@ -5342,7 +5342,7 @@ enum wmi_sta_ps_param_pspoll_count {
> =A0#define WMI_UAPSD_AC_TYPE_TRIG 1
> =A0
> =A0#define WMI_UAPSD_AC_BIT_MASK(ac, type) \
> -	((type =3D=3D=A0=A0WMI_UAPSD_AC_TYPE_DELI) ? (1<<(ac<<1)) : (1<<((ac<<1=
)+1)))
> +	((type =3D=3D=A0=A0WMI_UAPSD_AC_TYPE_DELI) ? (1 << (ac << 1)) : (1 << (=
(ac << 1) + 1)))

There are a bunch of unnecessary parentheses here.
This could also use the BIT macro:

#define WMI_UAPSD_AC_BIT_MASK(ac, type) \
	(type =3D=3D WMI_UAPSD_AC_TYPE_DELI ? BIT(ac << 1) : BIT((ac << 1) + 1))


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
