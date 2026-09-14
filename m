Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C85C88E66
	for <ath10k@archiver.kernel.org>; Mon, 14 Sep 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gS0PasUdCVmtQZHlDSGBeMxyLgFshGbkXoV5dyvEzpg=; b=EMGNNdfaaU0Z4gMzkwWb0FohCQ
	ppCkkhpMGL6UYQMgmBQs3A3ZoRzjN98qKRkOyiyu60RX1xfF+Cp6uKAsiAf9ae2lG3d2f/XS9Zx0Y
	gYRnX4/Orti3lXX5CpGnJMTvuicYSbtk7Ev42hHGow2P1jUTfcxuiWtiFDyGDLXP64ViIb3YzkcQ4
	JPkLiGaCvZ2Epht/ptEVv78cMhZYeLwZJUPrYpDM+rasYO3COQHe23zXg+UQcFCmWmaJHa/V7IMaJ
	oB2jMl7HJwY0wu8Oa+S5kvyzDidScAX0z5HSy3HQn3ZKLwSl8DK6G7tQYP+IQU+07wdARkyV/EtTr
	ESEqjM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x661H-00000003bfs-1E08;
	Mon, 14 Sep 2026 12:42:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x661D-00000003bZt-0IdM
	for ath10k@lists.infradead.org;
	Mon, 14 Sep 2026 12:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789389761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gS0PasUdCVmtQZHlDSGBeMxyLgFshGbkXoV5dyvEzpg=;
	b=UXDtM5ShJvlx+ayJMQWy2GJ1xFT+kcJjWO/pBJ7XYFJZlJiojuqayyM9PePXtQrBEHnTyB
	fO7rfG1Aks3ioDg2W7RFsAvtnYUBXCKWdujJru27mhUIRqjUMAR26brFJvJUJbulIR7T+u
	A1Ue8ZBp96VFlA5VaBEIqSbq6/hN2SY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-ROAKiUATP9Sm4zdp5Rer-Q-1; Mon,
 14 Sep 2026 08:42:36 -0400
X-MC-Unique: ROAKiUATP9Sm4zdp5Rer-Q-1
X-Mimecast-MFC-AGG-ID: ROAKiUATP9Sm4zdp5Rer-Q_1789389751
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F119A180A9F5;
	Mon, 14 Sep 2026 12:42:28 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B83C341D;
	Mon, 14 Sep 2026 12:42:13 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/3] firmware: qcom: scm: pass struct qcom_scm through the
 API
Date: Mon, 14 Sep 2026 14:41:53 +0200
Message-Id: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bsE0tPpKdBBdaw+VKEQQ/j3pO
 DAzLxTKTAVm8UKmmwtfZ4O+E+B3d26EHBqDksrISY5Y/IGhiZ7QJUajB+ets1FbCy1KmSI//3B
 Za/0AntZYi2AAAAA=
X-Change-ID: 20260908-scm-device-api-634ac7a7f377
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Govind Singh <govinds@codeaurora.org>, 
 Niklas Cassel <niklas.cassel@linaro.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 op-tee@lists.trustedfirmware.org, Maxime Ripard <mripard@kernel.org>, 
 Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789389733; l=4126;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=kKUjFxTDzaIvfCLVxP1OmjKiQRgwNhTIUBFn6PNx22w=;
 b=ptN78nZt4fGWWnpdDZyVENIgI04y8a4PWpV9Q7ESU1lJXI6I5/2224GMHxqfT8NR3RqXorNth
 jHJX4SMRZ0tCfmG8DtbgRZpcTf2pE4dns304nz4VWJerDfTGzhcT+6A
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tCfpi1Cd8nODo10v2g1z899QZC2JG5bxWsVLNpMTx98_1789389751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_054243_182774_D2B66E5E 
X-CRM114-Status: GOOD (  13.39  )
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

The SCM driver still funnels every call through a process-wide
__scm singleton.

This series threads struct qcom_scm through the driver and the
exported API, then drops the global.

Series summary
--------------
Patch 1: Internal helpers take the instance. Callbacks that only
have a struct device or reset_controller_dev recover it
with drvdata / container_of. Exported signatures stay
unchanged so this patch is bisectable on its own.

Patch 2: Exported calls take struct qcom_scm * as the first
argument. The type stays opaque in qcom_scm.h.

    Children of the SCM device (qseecom, tzmem, qcomtee)
    use dev_get_drvdata() on the parent. Other consumers
    call qcom_scm_get(), which finds the bound platform
    device and returns NULL until probe has marked the
    instance ready. Callers that need SCM return
    -EPROBE_DEFER; callers that only use it for an optional
    path (rmtfs VMIDs, fastrpc vmids, PAS region assign,
    Venus CP, HDMI HDCP, Adreno fuse poke) skip the lookup
    or tolerate NULL. qcom_pas_* is unchanged: PAS has a
    TEE backend, so those ops keep struct device * and the
    SCM backend uses drvdata.

Patch 3: Drop __scm. Readiness is scm->available with the same
release/acquire pairing as today. Module-parameter
stores reuse qcom_scm_get(); shutdown uses
platform_get_drvdata().

No intended change in SCM calling convention or wait-queue
behaviour.

Testing
-------

Booted to a shell on Qualcomm SA8775P Ride4 with current series.
qcom_scm bound as firmware:qcom_scm; probe logged SMC ARM 64 and
the tz-ffi reserved-memory assignment. Consumers were not exercised.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Albert Esteve (3):
      firmware: qcom: scm: pass qcom_scm to internal helpers
      firmware: qcom: scm: pass qcom_scm through the exported API
      firmware: qcom: scm: drop the __scm global

 arch/arm/mach-qcom/platsmp.c                     |   3 +-
 drivers/cpuidle/cpuidle-qcom-spm.c               |  28 +-
 drivers/firmware/qcom/qcom_qseecom.c             |   3 +-
 drivers/firmware/qcom/qcom_scm-smc.c             |   2 +-
 drivers/firmware/qcom/qcom_scm.c                 | 518 +++++++++++++----------
 drivers/firmware/qcom/qcom_scm.h                 |   2 +-
 drivers/firmware/qcom/qcom_tzmem.c               |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c            |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          |   8 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c             |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       |   8 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h       |   3 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c          |  18 +-
 drivers/irqchip/qcom-pdc.c                       |   6 +-
 drivers/media/platform/qcom/venus/firmware.c     |  10 +-
 drivers/misc/fastrpc.c                           |  31 +-
 drivers/net/wireless/ath/ath10k/qmi.c            |  12 +-
 drivers/net/wireless/ath/ath10k/qmi.h            |   3 +
 drivers/nvmem/sec-qfprom.c                       |   6 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               |  11 +-
 drivers/remoteproc/qcom_q6v5_mss.c               |   6 +-
 drivers/remoteproc/qcom_q6v5_pas.c               |  12 +-
 drivers/soc/qcom/ice.c                           |  23 +-
 drivers/soc/qcom/ocmem.c                         |  22 +-
 drivers/soc/qcom/rmtfs_mem.c                     |   8 +-
 drivers/tee/qcomtee/call.c                       |   7 +
 drivers/tee/qcomtee/core.c                       |   6 +-
 drivers/tee/qcomtee/qcomtee.h                    |   2 +
 drivers/thermal/qcom/lmh.c                       |  22 +-
 include/linux/firmware/qcom/qcom_qseecom.h       |   5 +-
 include/linux/firmware/qcom/qcom_scm.h           | 117 ++---
 32 files changed, 566 insertions(+), 363 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260908-scm-device-api-634ac7a7f377

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>


