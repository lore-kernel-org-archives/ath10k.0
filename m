Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FE3C54F54
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjVcHniSLBRKWrFsvh8Ah11kb/c0CCbICSTiExfKTL4=; b=olIQO50kJj3ACoHjduqiIJfsPE
	9jXhsQN3tn5sNHkywGrTNqQ7205vU0DvJjUAi60lSpbcGRN7g+4Bo65pjSjh2fMlM2lChqByla94l
	LlakGtbPYXjpAyStkSHy969xZl+LVPWKV/oggZp4Yjo0zEP+TNLzCyMI4QXweRLpVsWr+DbKiRrK4
	61Ju7T+3Tt+hGtjSryDrt3lKki/1GN8h1IBJBHK4IowbAy9v/NvyCLwOYp7krRZngOk6Y9dpkdJzx
	ANRK4lYVKGXzrprq3S4kbLq2PjzhtXgCrtqFipGSpuiqLx/8qQiltCHvuMzvCUEJA2cLjKUDuuq55
	S/ehck4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmui-0000000CXRH-1EGd;
	Fri, 31 Jul 2026 13:04:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmug-0000000CXR7-40Ji
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 13:04:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41BB043B21
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229961F0155A
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785503074;
	bh=CjVcHniSLBRKWrFsvh8Ah11kb/c0CCbICSTiExfKTL4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kDTY8SSg2DvDRu4yerj6P2/KRGWPXKPVdCkx3GGtU+QyCTiEF3B+6cT/A8fXVC9J8
	 4Cs7lYME0Gr0Zof98cYuhyP7NKFllsvmKYY9l+exMH9vTpuE4gguSk5ySlsy7nQCrb
	 F7TKXLgpm3Mg6E7ev0rPBSmSa9LHkreXpNEScPPJ2bJ59j7nzrllJtEW+zeF63rqem
	 9/YrjsWFaWM7gPyh7a0kiitUWSv4XnO3kD6qYXY5Pkc56p2Z33LDrKvm/PxyX01O6p
	 TW0mud+0y728uJ7Boxsv5sNUCzPKLomkOvyTwNz1g3SaNnOakHNLxj+hdcYGY/KCSf
	 1E4yWCAJLqMyQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9452244aso9093481fa.3
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 06:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+p+bFkF1iPDZadYToIh3QH4m6nBzVwqdopsqRB1Xn2PrFbhXuisW0oWoY3yhYQp1GVs6mIi4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2a/A3qiPNEyIimosXnVz8pRfKRez3iB5XQThQuQT1dfHWLGhy
	d8UGumRfWDXg8g6o4ERky3JIzTiBFzL6o3dpaQFAszHpECdI6gkF0fwryrglZjB73NGR5FKGoy6
	/evXPdmWdzDSUC96NHOt9JZCtMRroExpkL8j9bqkwXQ==
X-Received: by 2002:a05:651c:4396:20b0:39c:a06f:12ba with SMTP id
 38308e7fff4ca-39f7e44b426mr2905841fa.40.1785503072391; Fri, 31 Jul 2026
 06:04:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 08:04:30 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 08:04:30 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFEp6-3X+PCXZdEy1p47XUDs7cT16JDjt0=928Jjkeik_haaQw@mail.gmail.com>
MIME-Version: 1.0
References: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com> <CAFEp6-3X+PCXZdEy1p47XUDs7cT16JDjt0=928Jjkeik_haaQw@mail.gmail.com>
Date: Fri, 31 Jul 2026 08:04:30 -0500
X-Gmail-Original-Message-ID: <CAMRc=McA3BqoazxvGDu1_WoT9x0ujXT_80jKPp+5Jb0Rda9zOA@mail.gmail.com>
X-Gm-Features: AUfX_my34O5ZqodmTjdz_FwlJrp9NnalnGl6Ep4FvspsE7xopR-UD4qRTMMPUOE
Message-ID: <CAMRc=McA3BqoazxvGDu1_WoT9x0ujXT_80jKPp+5Jb0Rda9zOA@mail.gmail.com>
Subject: Re: [PATCH v2] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pci@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, 31 Jul 2026 10:43:19 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> On Fri, Jul 31, 2026 at 10:29=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>
>> The way power sequencing works means that a call to pwrseq_power_on()
>> does not necessarily result in the pwrseq target being powered-on at
>> that time: it may have already been powered on before. Similarly: a call
>> to pwrseq_power_off() does not have to result in an actual powering off
>> of resources: there may still be other users that requested a power-on
>> before.
>>
>> We will also introduce the concept of "non-controllable" pwrseq targets
>> soon which further increases the disconnect between the naming
>> convention and the actual semantics.
>>
>> What consumers of pwrseq descriptors actually do is: they *vote* for a
>> powering on of a given target or retract that vote. These operations
>> could be called get/put in line with runtime PM but this could become
>> confusing since we already provide pwrseq_get/put() for a different
>> purpose. pwrseq_vote_on/off() also have been rejected as unusual in
>> the tree.
>>
>> Change the name of the two functions to pwrseq_enable/disable() which
>> better reflects their purpose and semantics and also mirrors other
>> enable-counted resources like regulators and clocks. No functional chang=
e
>> intended.
>>
>> If at any point users need to know *when* the exact power event happens,
>> we can provide that information in the form of a notifier.
>>
>> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> ---
>> I've floated the idea to rename the two pwrseq functions from "power
>> on/off" to "vote on/off". I've sent a patch but the overwhelming
>> consensus seem to be that enable/disable naming is preferred.
>>
>> I'm doing it in a single commit that should go through the pwrseq tree
>> with Acks from subsystem maintainers.
>>
>> [1] https://lore.kernel.org/all/CAMRc=3DMefxn81d0VUwmQgwFtffkL1=3DEr_1VQ=
ZCbC1Sa-Qph4t1w@mail.gmail.com/
>> ---
>> Changes in v2:
>> - Change the naming convention to enable/disable
>> - Link to v1: https://patch.msgid.link/20260727-pwrseq-vote-rename-v1-1-=
a2029aeeac65@oss.qualcomm.com
>> ---
>>  Documentation/driver-api/pwrseq.rst      |  4 ++--
>>  drivers/bluetooth/hci_qca.c              |  4 ++--
>>  drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
>>  drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---
>>  drivers/pci/pwrctrl/generic.c            |  4 ++--
>>  drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  4 ++--
>>  drivers/power/sequencing/core.c          | 16 ++++++++--------
>>  include/linux/pwrseq/consumer.h          |  8 ++++----
>>  8 files changed, 25 insertions(+), 25 deletions(-)
>>
>> diff --git a/Documentation/driver-api/pwrseq.rst b/Documentation/driver-=
api/pwrseq.rst
>> index ad18b2326b689a41471216f3889480b11768ca82..0c315ab1138b02540fae60b3=
9928c580027c0f7c 100644
>> --- a/Documentation/driver-api/pwrseq.rst
>> +++ b/Documentation/driver-api/pwrseq.rst
>> @@ -50,9 +50,9 @@ Consumer interface
>>  The consumer API is aimed to be as simple as possible. The driver inter=
ested in
>>  getting a descriptor from the power sequencer should call pwrseq_get() =
and
>>  specify the name of the target it wants to reach in the sequence after =
calling
>> -pwrseq_power_up(). The descriptor can be released by calling pwrseq_put=
() and
>> +pwrseq_enable(). The descriptor can be released by calling pwrseq_put()=
 and
>>  the consumer can request the powering down of its target with
>> -pwrseq_power_off(). Note that there is no guarantee that pwrseq_power_o=
ff()
>> +pwrseq_disble(). Note that there is no guarantee that pwrseq_disble()
>>  will have any effect as there may be multiple users of the underlying r=
esources
>>  who may keep them active.
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 345f602e9ce233a0934a73a85d1e7c17c4f3210d..e713fc06b73402ae3d57794e=
d0870df8394a796a 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -2259,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
>>         }
>>
>>         if (power && power->pwrseq) {
>> -               pwrseq_power_off(power->pwrseq);
>> +               pwrseq_disble(power->pwrseq);
>
> Nit: s/pwrseq_disble/pwrseq_disable ?
>

Ah dang it, how did I miss it, I test-built it. :/

Thanks for catching it.

Bart

