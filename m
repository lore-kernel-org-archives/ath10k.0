Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0509FC5516D
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xxXBjOQaVivJJP+m3lH/e6Blj4o5INx0Tg6Ob2u8pnA=; b=vKcps0HIqz1ZoR/VUhrss8Woxt
	FSWQb8G2IvEl3d1rfOuWhXAT+aoZ3SxCjhUf0kNp8KLbQTsL6r4YAHP3tB8AxKpj6LDbcvamExd9U
	imXM7+skXF0iO+Qf/gARwIBUaa0uM7/qOe4v5jiEThHQ8NZ6MwstoX25T6EffKQVALehO2+hP9NwQ
	7Iuq6diodlPAkyzbz4AFRrylWVrONtX+UZLXEu+DCCpJ1iNMqcBv6ggEvTaNjrqX8WBYKw6DG5Gnw
	seA2wmUJCsXD2Jx94sfArfqnI5mGHUYGPuQHCXc3YA5ndggmMF2vWi37+vchGTp+F2m6imw0+QRRt
	V7iWCrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpic6-0000000C473-1Kl8;
	Fri, 31 Jul 2026 08:29:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpic3-0000000C451-3X3N
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 08:29:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V850J23408234
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xxXBjOQaVivJJP+m3lH/e6
	Blj4o5INx0Tg6Ob2u8pnA=; b=GTCrjKsc7pOSyxjYJrmw9OUnCjxz7yB5X5zfxP
	vYY+TpGyRhhM9FifAOk0I9JK3yZdry3f6DcxkIdvd9J/bSrXtQrPn2rl4m+/xBil
	OGEmsbii3e8kGItxE75rvypznqI2UDMyZVQXxY/hVT9hki28ZoazKMSpv5TD6q2Q
	nASLm8wboCOF//N8fVN6W4iq4fq5nofR05lzTBKafeSKlhR1QDDuxo80R6Eq+H75
	ZYB+8xmAGo9eOs5HmdOmYYD4ZZ//ZP3ypDGtYfvEIlyXHU6zOtEen/CoVPyBWfvW
	+2xhHw1lWfQdk5v3uHPivrC3VqGI2rdMthiG/6XLeq8smLsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqvsr2qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 08:29:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso11583871cf.3
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486542; x=1786091342; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxXBjOQaVivJJP+m3lH/e6Blj4o5INx0Tg6Ob2u8pnA=;
        b=TVbhJjuukFeqfLS1+Gr3TLvAmBJXF8VL1r1KhpEwFJNugDlDQlarkj8hJk/9ULSuCG
         ruJ3xbL1fmX1lYKr9nYP/Mn8XQPE6sKak9x2+XND/Ubf/JgWbg2TPKsOQnVtnIWSNV64
         i2FyJTRDGAOUhojD+gJrcJgPqde92bORYr2p6+8FBYRQcd/M19RZRClxDthjYYkJ+7gQ
         ZgIv853BGxfHB13M1Eydcj8c9tUIsF9duXvLIuFJ9A+BxFi4XMQnh5YWWwJ/WDnBKmha
         lsgjfbASXEtROiqozoz/Blqp5M84z3OAMKqx6bybreihNs3bXfXk3d1IRmv7u8JMBSP/
         b8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486542; x=1786091342;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xxXBjOQaVivJJP+m3lH/e6Blj4o5INx0Tg6Ob2u8pnA=;
        b=jcWsjf5TiAvaaaPa9u2F87IseuFDC/czVmrzvGOUIvKgMRt7MAXvXWjY4J31SCfKGA
         WFFN613xpGyQzmwVNImPUTHC66YQ1v14k57t6qiCmr1UXXpSmJWTSim0ahtoA6whrIf2
         as9STYnsxL6vfK6SrYof+BySBeDBKyGc8xjcx2q99I9oPiuygTlbxJyYtAMd09gQaukJ
         s7sWJV+hxmZqLcZ71nbJal9TQP06vKT2nVBaGBib/9V8L2SrrDx007AhycbHjxU6T7Xg
         uZTSc57Iypv8vbtEhl9Or948EvmCouWPz0QEdb/l56rC704lTwgxXLCe7v5NOc9qxcV3
         PCuA==
X-Forwarded-Encrypted: i=1; AHgh+RqPiYyh58gg3i7LXhmg0u72LbtqEpjdgbKCwnH7iPm21krWGMhH9mI7/MLTTt483o2DFR1ru04=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMHqZ2EGjIsNYLfm0LnTt9It0t3/4U2pg4AVXYZm8gq8nWhI0
	aM1lguSQ4FG63QO9fcQkEP2x4fgsIlBiKbaLmgGZQ+U/mn/m+z5XVkHA6S9sEduRPEIhkEsYjuT
	39kgMVV001Smr4evbj7SRfMhUe4SpTUCxsO2I8XVKKeYkmNHimtZvf6YfYxrquu+s
X-Gm-Gg: AR+sD11zf/97aDPb2I32GrSY22PCFoCTVRyW0XhP043rAv6isF5qkap8+8+K6nGp1d4
	nP7WFXHrnf1PquZp1VfD07+qSgJlYnLMEAprz0hhBn4pe/hp+cZmODkL5vd05yiP4n+3OOIhYrk
	OO4WTlQpsnEg8ZlJ/vUqyB9h8CSMjPpZfKlddEtH0nyAFLoel/R6csuwEiyCMAH4L3iwXiRZNAd
	S9CxOk4XPxXgqwyFeMvRK5/NswvLbt/jBAG/EXAPQhI+jEbEmrAbsz7Hzjc1gOUBUi/WlJGWvLZ
	0l/JCrgqPeP5be8NdRW8kAdhQYA+faKVCqZJWeguZgRcsow1p1LMYBxY/Pgy+uHc13lYhjLsA7e
	yB2CoizKXnIf/oyU6KPoiNuekBRoFFw==
X-Received: by 2002:a05:622a:6093:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b4af3e60bmr13993031cf.15.1785486541574;
        Fri, 31 Jul 2026 01:29:01 -0700 (PDT)
X-Received: by 2002:a05:622a:6093:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b4af3e60bmr13992841cf.15.1785486541160;
        Fri, 31 Jul 2026 01:29:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c90f52sm66412266b.16.2026.07.31.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:29:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:28:50 +0200
Subject: [PATCH v2] power: sequencing: rename pwrseq_power_on/off() to
 pwrseq_enable/disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMFcbGoC/32NTQ6CMBCFr0Jm7ZC2xlZdcQ/DopZRmgiFDlYN6
 d2tHMDNS76X97MCU/TEcK5WiJQ8+zAWULsKXG/HO6HvCoMSSgujDE6vyDRjCgthpNEOhFfjOiX
 FXml9hFKcIt38exu9tIV7z0uIn+0jyZ/7dy5JlGhL4mSJrNOHJjDX89M+XBiGugi0OecvQ5Id4
 bsAAAA=
X-Change-ID: 20260727-pwrseq-vote-rename-b7cd21032668
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11617;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1GlGb33gRFeu0ldp5kUwM7ApHq+RZYDeUNAyNeeeQn8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFzFJt6O8wisou3BKsioXgAk/mjF1g90Iazw4
 Q+GK32nk4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxcxQAKCRAFnS7L/zaE
 w5KiD/9uG0pyhUUSXNyne3ZBbn/ozYp9Z/b8T3f++gwk55/CBAUPOmX2LtavoIZR4mMmKoIubHQ
 CgOycHiDpbS8ci6fYmDKLOQAE9NsVYGIn94H6/bCf/FjcCwHgf5qsoCSadZSpPkSexsmLTgmNn2
 37xmxDx1e6dmukUv3P0INHQPENmbUC2vv3k9SEGdXfiT61tI35vJpW/S5wbTzFwU8YMeW/rFz4b
 I7GafpAu+h2W39O3kaFwzNSiDQ0JG7dFUWR/HqA0zxzKaf1k2LgscpgJ7bFP5P3Cw9Bmj1IJ0R2
 Hi2etbbfqkMkXtIwB0E17PCl77rDRYvBPSudQ2wamrrNNCEy6Qjclz/HJl8MXzXUeQPGVIGQ9jZ
 M0IDAV2EVtfXqecbzeghxirJ6F3VX3ogfRoITkcPyx+PBTYbuCDAZapLb8rdk+AlE3jSnjpGXtC
 ln3DCt10POHURDM5TAUlnSta0cHg01EDOqzu+JbtT/JexL+ZTeHUpe7a26j8y6UC5Ht0NnqW0bs
 OFZeV5fgIa5QgWJROY77j3rgqUSDOEMycs+b7kXPS0WskKCMkZ5ntraOM63MbzcFsJ7hdWTzMGm
 QHCctpTrQZeHX1/x/CrVjqgwC8J1UeBkVUvpQnbVti2h3uQtq+5IXhc05rdo/GdrTibeOfP/BAx
 mGO/h5vwIDjrlWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfXy/JhO5Y4cDSc
 v3SAX1tyqSQs/qWbS/z/6TImy5deJSfR/ZUTKzeSZaWIV5yDHDbKDDgFuyjtdDXdLzyCQeuXlmY
 m8hIk4paqk1uvqSOFY6agIzUCcYQ0xg=
X-Authority-Analysis: v=2.4 cv=TN51jVla c=1 sm=1 tr=0 ts=6a6c5cce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8
 a=RTdnRIbMq3CNlSfCOOQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 5Km_3HtVT2Q69lsojGkd7BZzkw-Y3Gm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX+TcP/IBKgx7d
 b3g8M6ugEHZODaJIsx3nIfslb4iEU6r+JvyQEtVi7i+yG18i/SUViMV/MXl10RQPfVkrkc80SlL
 tvIU/icFdzkaxA5yICz+KjbwgtE2+Oyo3xvyCn4523+zFKzRk3wqod6UpHX4tPhbfJkwOTXu3u2
 8KaY/0ckCRMoYwfYoNarHH4eatmzr4xtBipi7qzQet/4RIOLIpDRh7KnMP2UyvnKoYghvDbwmZV
 GXBzanxIkKwjMwoyGdUaF6YzgYYm326x2JtVMblhsYuYHnrsUl3SDZW488kAX8pyzsihk6/T53V
 Yfc9VAO3VArS3ppl6VQ8fcplVBgBlVpxzsq0jCKrG1EEA7841Yf5RiLuf6n5DN2qQtwjGMhpLUs
 Vn1rT5cpk16xWtHNI6Pz5WDrJqfzbm8mDCfIQbjx4KliiQoKfJtcpgkkhz3QUP7g61UWp2eb8lM
 JaVbM2LkeVfWuxPFwxQ==
X-Proofpoint-GUID: 5Km_3HtVT2Q69lsojGkd7BZzkw-Y3Gm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_012904_029550_E2F5B97B 
X-CRM114-Status: GOOD (  24.59  )
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

The way power sequencing works means that a call to pwrseq_power_on()
does not necessarily result in the pwrseq target being powered-on at
that time: it may have already been powered on before. Similarly: a call
to pwrseq_power_off() does not have to result in an actual powering off
of resources: there may still be other users that requested a power-on
before.

We will also introduce the concept of "non-controllable" pwrseq targets
soon which further increases the disconnect between the naming
convention and the actual semantics.

What consumers of pwrseq descriptors actually do is: they *vote* for a
powering on of a given target or retract that vote. These operations
could be called get/put in line with runtime PM but this could become
confusing since we already provide pwrseq_get/put() for a different
purpose. pwrseq_vote_on/off() also have been rejected as unusual in
the tree.

Change the name of the two functions to pwrseq_enable/disable() which
better reflects their purpose and semantics and also mirrors other
enable-counted resources like regulators and clocks. No functional change
intended.

If at any point users need to know *when* the exact power event happens,
we can provide that information in the form of a notifier.

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I've floated the idea to rename the two pwrseq functions from "power
on/off" to "vote on/off". I've sent a patch but the overwhelming
consensus seem to be that enable/disable naming is preferred.

I'm doing it in a single commit that should go through the pwrseq tree
with Acks from subsystem maintainers.

[1] https://lore.kernel.org/all/CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com/
---
Changes in v2:
- Change the naming convention to enable/disable
- Link to v1: https://patch.msgid.link/20260727-pwrseq-vote-rename-v1-1-a2029aeeac65@oss.qualcomm.com
---
 Documentation/driver-api/pwrseq.rst      |  4 ++--
 drivers/bluetooth/hci_qca.c              |  4 ++--
 drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
 drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---
 drivers/pci/pwrctrl/generic.c            |  4 ++--
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  4 ++--
 drivers/power/sequencing/core.c          | 16 ++++++++--------
 include/linux/pwrseq/consumer.h          |  8 ++++----
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/driver-api/pwrseq.rst b/Documentation/driver-api/pwrseq.rst
index ad18b2326b689a41471216f3889480b11768ca82..0c315ab1138b02540fae60b39928c580027c0f7c 100644
--- a/Documentation/driver-api/pwrseq.rst
+++ b/Documentation/driver-api/pwrseq.rst
@@ -50,9 +50,9 @@ Consumer interface
 The consumer API is aimed to be as simple as possible. The driver interested in
 getting a descriptor from the power sequencer should call pwrseq_get() and
 specify the name of the target it wants to reach in the sequence after calling
-pwrseq_power_up(). The descriptor can be released by calling pwrseq_put() and
+pwrseq_enable(). The descriptor can be released by calling pwrseq_put() and
 the consumer can request the powering down of its target with
-pwrseq_power_off(). Note that there is no guarantee that pwrseq_power_off()
+pwrseq_disble(). Note that there is no guarantee that pwrseq_disble()
 will have any effect as there may be multiple users of the underlying resources
 who may keep them active.
 
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 345f602e9ce233a0934a73a85d1e7c17c4f3210d..e713fc06b73402ae3d57794ed0870df8394a796a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2259,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
 	}
 
 	if (power && power->pwrseq) {
-		pwrseq_power_off(power->pwrseq);
+		pwrseq_disble(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
         }
@@ -2319,7 +2319,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	int ret;
 
 	if (power->pwrseq)
-		return pwrseq_power_on(power->pwrseq);
+		return pwrseq_enable(power->pwrseq);
 
 	/* Already enabled */
 	if (power->vregs_on)
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index a71d5b35601e7b996428312028a4c0542a5b1350..031fad8adf4f4843e852000d3d6ba45d0e4b0aeb 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -352,12 +352,12 @@ static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
 
 static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
 {
-	return pwrseq_power_on(pvr_dev->pwrseq);
+	return pwrseq_enable(pvr_dev->pwrseq);
 }
 
 static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
 {
-	return pwrseq_power_off(pvr_dev->pwrseq);
+	return pwrseq_disble(pvr_dev->pwrseq);
 }
 
 const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq = {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 3106502275781d32d17a45a661362206144df6b3..d7e23971fe1da99f6b5f7559d62d04e2044d8950 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1025,7 +1025,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = pwrseq_power_on(ar_snoc->pwrseq);
+	ret = pwrseq_enable(ar_snoc->pwrseq);
 	if (ret)
 		return ret;
 
@@ -1042,7 +1042,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 vreg_off:
 	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
 pwrseq_off:
-	pwrseq_power_off(ar_snoc->pwrseq);
+	pwrseq_disble(ar_snoc->pwrseq);
 
 	return ret;
 }
@@ -1060,7 +1060,7 @@ static int ath10k_hw_power_off(struct ath10k *ar)
 	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
 
 	if (ar_snoc->pwrseq)
-		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
+		ret_seq = pwrseq_disble(ar_snoc->pwrseq);
 
 	return ret_vreg ? : ret_seq;
 }
diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index a7e599d841e6289db161b19a93ba5a61d9e0ab1c..d366883355173eac1a2631b73e5e041666ac23ad 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -29,7 +29,7 @@ static int slot_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	int ret;
 
 	if (slot->pwrseq) {
-		pwrseq_power_on(slot->pwrseq);
+		pwrseq_enable(slot->pwrseq);
 		return 0;
 	}
 
@@ -48,7 +48,7 @@ static int slot_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
 						struct slot_pwrctrl, pwrctrl);
 
 	if (slot->pwrseq) {
-		pwrseq_power_off(slot->pwrseq);
+		pwrseq_disble(slot->pwrseq);
 		return 0;
 	}
 
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
index a308bf4b5fc01d23b75db4cd396201c3ba3fe695..2a6f46f6e2012dd985b657c97c85879ba13b5133 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
@@ -56,7 +56,7 @@ static int pwrseq_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct pwrseq_pwrctrl *pwrseq = container_of(pwrctrl,
 					   struct pwrseq_pwrctrl, pwrctrl);
 
-	return pwrseq_power_on(pwrseq->pwrseq);
+	return pwrseq_enable(pwrseq->pwrseq);
 }
 
 static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
@@ -64,7 +64,7 @@ static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
 	struct pwrseq_pwrctrl *pwrseq = container_of(pwrctrl,
 					   struct pwrseq_pwrctrl, pwrctrl);
 
-	return pwrseq_power_off(pwrseq->pwrseq);
+	return pwrseq_disble(pwrseq->pwrseq);
 }
 
 static int pwrseq_pwrctrl_probe(struct platform_device *pdev)
diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da915985339d3de507fc36dd158b0035a99..34d5c0af6f37bdbfa9d656d95795d38cc7e38762 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -708,7 +708,7 @@ void pwrseq_put(struct pwrseq_desc *desc)
 	pwrseq = desc->pwrseq;
 
 	if (desc->powered_on)
-		pwrseq_power_off(desc);
+		pwrseq_disble(desc);
 
 	kfree(desc);
 	module_put(pwrseq->owner);
@@ -874,7 +874,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *pwrseq,
 }
 
 /**
- * pwrseq_power_on() - Issue a power-on request on behalf of the consumer
+ * pwrseq_enable() - Issue a power-on request on behalf of the consumer
  *                     device.
  * @desc: Descriptor referencing the power sequencer.
  *
@@ -887,7 +887,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *pwrseq,
  * Returns:
  * 0 on success, negative error number on failure.
  */
-int pwrseq_power_on(struct pwrseq_desc *desc)
+int pwrseq_enable(struct pwrseq_desc *desc)
 {
 	struct pwrseq_device *pwrseq;
 	struct pwrseq_target *target;
@@ -925,14 +925,14 @@ int pwrseq_power_on(struct pwrseq_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pwrseq_power_on);
+EXPORT_SYMBOL_GPL(pwrseq_enable);
 
 /**
- * pwrseq_power_off() - Issue a power-off request on behalf of the consumer
+ * pwrseq_disble() - Issue a power-off request on behalf of the consumer
  *                      device.
  * @desc: Descriptor referencing the power sequencer.
  *
- * This undoes the effects of pwrseq_power_on(). It issues a power-off request
+ * This undoes the effects of pwrseq_enable(). It issues a power-off request
  * on behalf of the consumer and when the last remaining user does so, the
  * power-down sequence will be started. If one is in progress, the function
  * will block until it's complete and then return.
@@ -940,7 +940,7 @@ EXPORT_SYMBOL_GPL(pwrseq_power_on);
  * Returns:
  * 0 on success, negative error number on failure.
  */
-int pwrseq_power_off(struct pwrseq_desc *desc)
+int pwrseq_disble(struct pwrseq_desc *desc)
 {
 	struct pwrseq_device *pwrseq;
 	struct pwrseq_unit *unit;
@@ -966,7 +966,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pwrseq_power_off);
+EXPORT_SYMBOL_GPL(pwrseq_disble);
 
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..5e94b0b9c38b036fc40e3e2c8c6e1020d0d0bb6e 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -20,8 +20,8 @@ void pwrseq_put(struct pwrseq_desc *desc);
 struct pwrseq_desc * __must_check
 devm_pwrseq_get(struct device *dev, const char *target);
 
-int pwrseq_power_on(struct pwrseq_desc *desc);
-int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_enable(struct pwrseq_desc *desc);
+int pwrseq_disble(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -43,12 +43,12 @@ devm_pwrseq_get(struct device *dev, const char *target)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int pwrseq_power_on(struct pwrseq_desc *desc)
+static inline int pwrseq_enable(struct pwrseq_desc *desc)
 {
 	return -ENOSYS;
 }
 
-static inline int pwrseq_power_off(struct pwrseq_desc *desc)
+static inline int pwrseq_disble(struct pwrseq_desc *desc)
 {
 	return -ENOSYS;
 }

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260727-pwrseq-vote-rename-b7cd21032668

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


