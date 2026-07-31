Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2691C5516D
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I7QdW2PBreeH2I/q/W9dkzOrQKYFPLU3+DU1c9bD4Hw=; b=r4m0clHyNOYUO9ysvApjRi8lk6
	bygZ+Kp9eVOzph1zUovWxSLJL/S6LgtulH4DColGgR8uq9FCM/GEfL7dZYG7onc3KdrLmapmDxUQS
	Uso5taXAI96e79P8WvllEMpGHDsieuvoOMWzCxJQPee6QRjjbgwiDyD87bUHdlNx8R24WigXdtqeb
	q7+r3/fXhFJ0NSImchehwALp2rBwVyDyocyGO9U4OUTjBGmny4G5r9WImSnIhcxSZ/e07iwSQTUi0
	vzPxN7D9Ilx7almrL++TntvpAyMS9QBXAlRjbEG5hkP3efIkB4V9Edfc4ic5pXVY6uLZoBVLpJ/nh
	FB8YVYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnVU-0000000CdXF-19tK;
	Fri, 31 Jul 2026 13:42:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnVR-0000000CdWX-1bJp
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 13:42:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCGwTR3978482
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I7QdW2PBreeH2I/q/W9dkz
	OrQKYFPLU3+DU1c9bD4Hw=; b=kokLOxeQr8liutJQR+sVROVyP9mN89ywBdMOpB
	urCHbNngljt5xMxE9DKGuBRhjFMW6PPNDeNaUjczbJ3JO1l2LKvIBu/hG8a7yGfX
	ZCozgLofknV/JfjRFdgZDAcffJ/al08D+o7PPnY/ZKe302nBXaCHM3VVhuwWkP78
	t0OIp6RsA2hBUQrKsugIlBARcPkLjlGF3jCwGNfICqt12H20LwybIDew6XxAAyiu
	jkz+nAC6c0MPCVlUFjIsxQZz5piYWTJS/fstrMvoh9Ko7EFSLCEQllrVA9MVrfao
	2ZpT9r2dTw4CqC2Qob8JOZspicyZV85hN4WhUYwPFGN1PfDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujurc3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:42:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso16505641cf.0
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785505350; x=1786110150; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I7QdW2PBreeH2I/q/W9dkzOrQKYFPLU3+DU1c9bD4Hw=;
        b=jMnsTQZ0PZgDXAAT14jSKv1iNgH+suTk59Rr+9eCyLo0025ltCxNit+D+yDO5sceuF
         pRAqnZDyM88UYxdn7ZoXyGow3T/eJHLHnYsErCbya4O8tzxU5Wj9wi6rxMks4RDWgdIb
         29jBQowjNZ2A/2P5Av3jj783Qkv6fP+8xw8r6SJ2chH5P4m0FEI8WmstxZ7tKIQlQHi7
         gT0SW3vnSuK8JZh+P8B1d4uhe+qrsHczaxZ1ueT2jFVbLGLnUcY0s5YzbxwI0ZoM74MV
         yI3BOMHUjMC4K2Xpxe3R+TCtuI6eINtOYxb3V978ZQVi0ocokPoaoHdls1sLgaBrzpZ9
         YiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505350; x=1786110150;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I7QdW2PBreeH2I/q/W9dkzOrQKYFPLU3+DU1c9bD4Hw=;
        b=nO5Za6dG3KcJ8coppld+160R4j8R7D/kRujBxE5dZkv6j3Z2lDjRpBluNrKpFcdtaj
         23Quee7u0ZlrOjc3yrTD6xanKbaoelIMUxb7FwENIQ/UUD6GD1aPH96Nv39VDLWJ56Zr
         kIm8b7OVcqOagAJjOngfwNz5RjM8oQmyVnAA3caDBQrKRrwDW3I/S1DNo8rB4ZP+d9Ne
         9GKpSR0SO2C9MJgUqyL4aTprv9Xfce8NYvgoyeCqAr5XtoC56nAHjGwNEeWlrU8lnY3L
         A0BeujkSX+f7OSHjw2xdO05Cp3XCqOAi/9s3yeiHTzGoKk+CeQ6HJ7rkEiFeRRnm3uGS
         hUwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Y1zUpCvDLJ9nS5nyXHZlq+qIaad2rUM7CxTY8k6p4IpU7bynM3FV+A3l8WINyrOnhcPTAOc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzA7yXN7oM1o0QLanQjWGsh2nA8JuLAg8nJ3MtLPt0ksAkTz/zO
	+9N+la+M/Wqfs0hzY9ETdKlS5HmnHASbo8aKY/pop7nkRNcb5ZQozlNORCL1SwXPGmGJ5xNf5ok
	SttrsR0MbINpOnH6gIN94XqKBP+Wq+2szBeZGNO9PsCtB0tVV8sTvlAFa9oN/GG85
X-Gm-Gg: AR+sD11qpNwNG5DXrI/n3Gc7UXqCc/UA0aqE1MAVdCsvjkamzagMBTI0zMtPUwCKiWm
	mvi1B4SdoPWH4BW0DRjhNzvsM1rzU0uBe3s29wqac5P+PVMyYRDEVuhDSirZYPY11Sc8fhksuNu
	TKp3p4NCGS3L6rP9F0mmP1b+QHSpDgnlCakeLu4UzQP9VjSSRyBH88j4tLVXjsFje7xbOgbTbp3
	vuHUTNT91lXmxnt7DMVi7FK41YF9LMbo6naMmnzgG76McL00Mh3ufiazIC2YhEs21s8zj7Mc6s5
	vQzuRSZTcBwM+UiiUxNagHgF3FV7lSU7/jfaRTX/NpXYJaQv+6YuluIdfsPH1qJKmda33souyaH
	SGoEsF5UlfjHXa2hWFzfLnUhtqrEWbA==
X-Received: by 2002:a05:622a:4c8c:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b567915d7mr2007101cf.33.1785505349378;
        Fri, 31 Jul 2026 06:42:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b567915d7mr2005921cf.33.1785505348617;
        Fri, 31 Jul 2026 06:42:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b4d4sm170638366b.3.2026.07.31.06.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:42:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:42:18 +0200
Subject: [PATCH v3] power: sequencing: rename pwrseq_power_on/off() to
 pwrseq_enable/disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-pwrseq-vote-rename-v3-1-44e60b8be053@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADmmbGoC/33NQQ6CMBAF0KuQri1pp9CCK+9hXNQyShOh0GLVE
 O5uYeWCuJnkT/68mUlAbzGQYzYTj9EG6/oUxCEjptX9HaltUibAQDIFig4vH3Ck0U1IPfa6Q3p
 VpgHOBEhZkXQ4eLzZ94aeLym3NkzOf7Yfka/bv1zklFOdGrVG1EaWJxdCPj71w7iuy9MgqxrhR
 xJ8V4IkFRUTpaoLiYztSMuyfAGchA57BQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11797;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZtYnblEv5u9xlI130waUKIQSQ7Ho1KTod+WjiROOSo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbKY9BLAKPCKKdAtGKsF/O1XETtWdpusNUE+kz
 k3xKaVeETeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamymPQAKCRAFnS7L/zaE
 w77CEACsyXT5/yMxHu3ndloSlpevSE+Xmz6RAu8QU74Y5sEYJSkVdMTfKAB07P6C3AXxrhXz1SO
 hAfDA26nBMR4HY8+Dbts3letQqVtiYaE1WYS6fzOj/lGy2E5FpT0TFLRlTrKAyQgCZBea7IOg6u
 b/xjl2grrnzOE73eKwZF2PDXi3kn2nLgCmykKxnLNpi9iNzp4TUL2BSz4T/cpsC0Bz/pUtYrXT1
 PTjFx7uZnUX83pxElnPGBDy8eX/1z3JhwkiTG99mcyqL44w6iFJh94A4Zu2436xDPG1NCZMtU5t
 mEa5hNLnnEGLv4whY+CTxMCv0pHuNVjT5ko1hdokSkv8EHPg1zvdBmRPFh8lK436UVN4d3RW73L
 1j352tkrJr98H+76xbO2Fpq0Pf+bjmU3Wki/pi0dWtw2mxASSxPPVNfZ0yLB0OIvwAglTGgTPYu
 UuPeuOHRJlrQg08cTreWJY2gdifIGumeRPprkwbDsHpWz8kFLbN/7hyazrw6ja+HZjLUeWq/Fdd
 g0A+he10ZFP9oO1Ep79ujgyAd2eP0PSHgrtQ2DCRZYdx0BR8D16rDGOT2bUfP8QHXua+856Gd50
 CVvv3GZ3gtF2vrFIqbmTf0nxqzf9F/Wl6Cue/AyixiYdka/DBV4hI3D4XaoTS9jO0jCFkVbvxxr
 6GFlCm9Og5+HPFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6ca647 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8
 a=RTdnRIbMq3CNlSfCOOQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: nBcFNoN6SQ1AQccNy2iOGnp1gqG27Q-W
X-Proofpoint-GUID: nBcFNoN6SQ1AQccNy2iOGnp1gqG27Q-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNCBTYWx0ZWRfX+7GahItHhVZw
 KynqyZHtRRS3nmF3oAt/UCMplXLch2hRUbWh5cWHAWe0RZXS3vSy7pmt4thtS/AMzIgUKjFniCj
 QQO25bw7dTICx+303+ng4K3lvu8Yf4D6AHC8K5jMAKdaAR9FJjSEp2Wu7gzHtujIICMtnsAqFi2
 HxUV4v5gzZ/DmxtbMTi2PZJut6kfFUglPpoG46qxNkydEyB+mg0Elg8fX/tPqslpEqShW8BsHUT
 aZKrE6YBF7NtJ7H14abqveMiWkOAk11wOm7uEd7yeXET9vzYVYAar/hNHPhQ5x08XsIZSNw047U
 Cd4BaNPNwYOX/2IsoW4aLlVT9Gu5I1bC5SqJHTflHVF3819sirTonIbEbQL/Q5RIEBygaF/JJT/
 7+dSIdGNGmLCiOa6dOdv9ZMPukeevols1nWMlKBqSoA32G+pDf98ErCmGJActZBRjqD+cXjrS3i
 XkKdCXZfcF3/E6TzbKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNCBTYWx0ZWRfX2kcaSGKJXirF
 6wr5lPwbiRS+bvA0DmTBCvq3ABvZ/Po7YNGGj6MvbNyL+a/wyPeY63QUqgFeTHLvKsdj0tRm44+
 sc7l2eor9T32g3nVsQtIroTAx83RpOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_064233_549366_94DF6C7E 
X-CRM114-Status: GOOD (  24.62  )
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
Changes in v3:
- Fix type: pwrseq_disble -> pwrseq_disable
- Link to v2: https://patch.msgid.link/20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com

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
index ad18b2326b689a41471216f3889480b11768ca82..e1056d1418451b0feda6567bab9eec1cbff682fb 100644
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
+pwrseq_disable(). Note that there is no guarantee that pwrseq_disable()
 will have any effect as there may be multiple users of the underlying resources
 who may keep them active.
 
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 345f602e9ce233a0934a73a85d1e7c17c4f3210d..faa964735adb17a05f2a8fac16f553b37b96020b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2259,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
 	}
 
 	if (power && power->pwrseq) {
-		pwrseq_power_off(power->pwrseq);
+		pwrseq_disable(power->pwrseq);
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
index a71d5b35601e7b996428312028a4c0542a5b1350..eb4b6ecdf4f4d09d96d17d0d53ec5cb876b21b50 100644
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
+	return pwrseq_disable(pvr_dev->pwrseq);
 }
 
 const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq = {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 3106502275781d32d17a45a661362206144df6b3..f28fed89cc28b45d72a9814be38d19e2cdf96943 100644
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
+	pwrseq_disable(ar_snoc->pwrseq);
 
 	return ret;
 }
@@ -1060,7 +1060,7 @@ static int ath10k_hw_power_off(struct ath10k *ar)
 	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
 
 	if (ar_snoc->pwrseq)
-		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
+		ret_seq = pwrseq_disable(ar_snoc->pwrseq);
 
 	return ret_vreg ? : ret_seq;
 }
diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index a7e599d841e6289db161b19a93ba5a61d9e0ab1c..d56171e0ee244691c3bdb0a72b81c65556a8081f 100644
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
+		pwrseq_disable(slot->pwrseq);
 		return 0;
 	}
 
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
index a308bf4b5fc01d23b75db4cd396201c3ba3fe695..c5ced87944b6ca3dc642692311ff504a650acec7 100644
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
+	return pwrseq_disable(pwrseq->pwrseq);
 }
 
 static int pwrseq_pwrctrl_probe(struct platform_device *pdev)
diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da915985339d3de507fc36dd158b0035a99..721e888b658d1f254513e126bb72f2d0487a8383 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -708,7 +708,7 @@ void pwrseq_put(struct pwrseq_desc *desc)
 	pwrseq = desc->pwrseq;
 
 	if (desc->powered_on)
-		pwrseq_power_off(desc);
+		pwrseq_disable(desc);
 
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
+ * pwrseq_disable() - Issue a power-off request on behalf of the consumer
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
+int pwrseq_disable(struct pwrseq_desc *desc)
 {
 	struct pwrseq_device *pwrseq;
 	struct pwrseq_unit *unit;
@@ -966,7 +966,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pwrseq_power_off);
+EXPORT_SYMBOL_GPL(pwrseq_disable);
 
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..16fad5f3e3ab563110598f733e4a6c10a7b13f2d 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -20,8 +20,8 @@ void pwrseq_put(struct pwrseq_desc *desc);
 struct pwrseq_desc * __must_check
 devm_pwrseq_get(struct device *dev, const char *target);
 
-int pwrseq_power_on(struct pwrseq_desc *desc);
-int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_enable(struct pwrseq_desc *desc);
+int pwrseq_disable(struct pwrseq_desc *desc);
 
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
+static inline int pwrseq_disable(struct pwrseq_desc *desc)
 {
 	return -ENOSYS;
 }

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260727-pwrseq-vote-rename-b7cd21032668

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


