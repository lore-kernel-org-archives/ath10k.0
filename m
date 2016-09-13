Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjoDX-0003uz-Qz
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 13:57:48 +0000
Received: by mail-vk0-x22c.google.com with SMTP id 16so159186511vko.2
 for <ath10k@lists.infradead.org>; Tue, 13 Sep 2016 06:57:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bmztm8qm.fsf@kamboji.qca.qualcomm.com>
References: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
 <1470140454-3899-3-git-send-email-bartosz.markowski@tieto.com>
 <87bmztm8qm.fsf@kamboji.qca.qualcomm.com>
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Date: Tue, 13 Sep 2016 15:57:17 +0200
Message-ID: <CACKGw+FAwPb2NLW5G8CnGH4X2eCCjUkuJwLoqW9w9rKpDuQJDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: add platform regulatory domain support
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 12 September 2016 at 17:35, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:

[...]

> > +#ifdef CONFIG_ACPI
> > +#define WRD_METHOD "WRDD"
> > +#define WRDD_WIFI  (0x07)
> > +
> > +static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
> > +{
>
> I don't think the ifdef is really necessary, acpi.h should handle that
> (hopefully). Also I changed the error handling to use standard error
> values and changed the info messages to dbg, they are too spammy in my
> opinion. Please check carefully my changes in the pending branch:
>
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fe91745381ec3999d8de6dedb07b396c82539717

I'm OK with the changes, I have not tried that though, except of
reviewing and compiling it (do not have access to the chromebook for
next few days). If you want to wait with it until I test it, it's fine
too.

Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
