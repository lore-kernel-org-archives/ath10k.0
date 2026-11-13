Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA7606A31C
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OSYMglnA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjI6ZJsL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QLSi/7NH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=; b=OSYMglnAmNOph9
	xio3OicCD2PWtQ0zVTjqj3dtNYzvXC4Kc4+9E1Q4HTox0KJotqfVKhvCnh6FC57DsrXS6F0FRGdLw
	+QsdXUpLycWxZGgWj1sP+nm+lF712+5lxme0ASXo0DoDW5+ksmI07igSjxLpKD+HCmTY/TgmTcyyc
	7loxFp7WHL0Hzeh4NQijWqmUEY7JUFC6ufcgIJmy5lJMuJVjofUGCJA2UwjQEemD0qvh8kSwkzQxS
	e29XKt8b7gBBfwQo9DcydnMTzm3pdvbO339IPWZ04a+JsccqxxoL/KBogBabp91HGpfxLhjK5VPxn
	mAMhOc3ToPq4v8OeMJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnWU-0000000CDCA-06Zp;
	Fri, 13 Nov 2026 09:24:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnWQ-0000000CDAp-2zjq
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 09:24:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V8lD913706
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 09:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=; b=DjI6ZJsLLOmPKpml
	Rb1DgvhUiI94W2nkfauti9BsnAXDBY+UWxmDhxuHTH2klLdP5X+mM0sgRO2hmEzY
	ym/qDXRmJFsVmcL7ZoHdQvKPtJSKnt/ad65kPMYboYzQedXe1mII1HARw4Zj/YEh
	2WMe1hsgkbbcYIUdalaMSivcp2unoX1rag4T02RHO1U4Fcv72PWrFMODcUjVxxpU
	BNzEbPRlgWAp0YCJGQNZMssp4LzRxLTgH81yPKji7I3gV1vODycMr8ra6lQoRLwf
	kKdbFE7NkpTZMJj9FyN1JA+4epNu/VXRZY1dxqNijP7yofyNlI7y3EDprSB6xUIQ
	iBr2GA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx34emh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 09:24:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eee6fa56bso7776296d6.2
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 01:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794561877; cv=none;
        d=google.com; s=arc-20260327;
        b=nepaXPwcG8W3rYgn53TadzGULPIT8iE6HbTQcow7Ztx7Hi0hL5KOoucdXwAxAM1PXU
         v00hTW1+udvPbNtwE+aTQO3a4I0mXd+ozY0+vr1EI0JAKnLKiS4SohVZSQvqEACbwEhW
         wfmu+c3241OHcAi+hB652+5WdOPuuSTO0c1L9xxz8ONXPtIX0Y7anIncY4cIDWE3ktCH
         ecS9zLnP3oLtKk3XTqdqwk4HWU92o48dnha0WN86jkNUf36Gq+DQ13KFrKkx/m7dgK/o
         mHUCNqglYPCZxchlMBXiFvFC5mJZgyB7NEIL+vP4odKo4q1zZd0k1d8LfnQhCXdHWB1x
         Cc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        fh=q0inOiUZ9edjUUU8vWbvrUGO7FP4RXthEMoc5b6ZLcc=;
        b=Ll/bYKY1xj5flkOoirWloJAchCfpijYfdRKxtmn4PUOPVULUyMrLEs/7R6aPmVYzXD
         dOWLBotmzGE26BknbLIRwEtu8gJAikXseGZb7sNhbhUs204a/jgPjk3S9oFWQnuI0Efu
         JL1cTSags5NSFU75SeOFl5TzXXz1aJxFsd0wOJLlfjhpn8d64BjSh6+gtVzMHPgrNkFA
         mxEbnQXyp5xIYTXLWmf/a4QwdnvKsaZEHj+Tp6wxwnSY1/nGR6aum1hFB8PccfMUyxzH
         Zk4lh0b6FR9r+TXh2QMNwmGCDH3EgMDhXPYKldLbH+G9EdUJZxmx0psbHOCbdtgyCzOL
         eSUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794561877; x=1795166677; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        b=QLSi/7NHaHMJdXUTUEl3uHDp3Wo4IzmN0GNn6xE/dtbwALyX3Wh2XIHZkDE3qB/Bqr
         wGuEJb3cPBs0TjsyuHrOT9NBGmtb4+vzBWcarHwfShn00rfCDr6c9AaiazSfyDvXsVNc
         BihnsBBIWctXLK/DZrMJ8QugfRoYEWzRRvNLiN68KpckEga1oBwrF9pR0+wdlueDDWvA
         NjmUsnse5JHcjkDW6ooB+vvXgfknd+cmVrBmNsCpIEQWKs3aAcKEb57Y4uDpS2gFesO4
         u7Ckc4exX/44bgba0TQNTy/LnYOccoi0F98wAqBRZrWGUFS3x2ZB7zWRjNDy62hlmMrE
         Nh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561877; x=1795166677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        b=fOKda7IowQaFACeznj3m7w+W3JxrWLClrmYSAdWhXwbZQYN5au+VMwNvsGJtJeBeLf
         5b/Fu73kdIGQskQ0dLdQrbTuV6iUTunStP1iOhTz7lXBVn6KIp9R5vu12luvB6lm5rh1
         npI8h0Lo2ilS/wies+wKTSaKYSVcudKpW7DuLOyVu93lbK5AY8jMtGkP8sGPN0eUs0O1
         EBfIuN5BtRtsRE4sK72TkNWlJw6PKG2uiwF8DnETK3HpBpN/z1fo4S1bkK+RimDr8+5i
         8akC2letWnROBrDWc+eF/099GEbjUYObPjDFk0Nske1Fxr1FWm2B8ejrxob8haWyeuAL
         EdJA==
X-Forwarded-Encrypted: i=1; AL+hErFOLKTkSHPTOWSosTM1mIR73eGrqmJYi69TGh2Ve0XUtFOSRv9fZPUGn5CbhbUsPMUWHYqsTvM=@lists.infradead.org
X-Gm-Message-State: APuU4Z8yPNE8vAsQxCHMC+H9gPfwUgssqJFoa7sHhfMFkRrSJjpftb50
	QJ/Xa1R2YSz6FysRE79eD8nrrNPDOzDlmhQDmVcNgLVXp8aGnaQnxHh5/y9ucYCrSbKM7F5QRmG
	1kivbke1B7n2LipAINgRJ6vXdqQd3c/QQoYEky8UK+f9hzqIFgWY3jkO9sumJ9j7nxGtyUbsu+E
	hmdhwCO+k5dw1GN9akhSgBWtA3FexwP/xZ+yNIktE=
X-Gm-Gg: AYBFou0e9DizIDZzUNr+kFHc0FX/WZ+txSfIDftw7LNzbLeqohTEY+Z3rSVLrMuMDyO
	Xd17aMVlqhRWx0V8/JOv3vIB5IvSTGYndpj2Lp3yFywa0MuL7rxvBjQJdNcJeXXFNdBOTfKk6Ig
	oj+VSb1IYJeMWRiviyzXra+E+OJR3dKej0DY/m2IF7SsW2EvzORo93XkLWxxgD/UBhplqYcBBfP
	+m1M/vk6APqf8LCiAy67ZRXqLBeFOsZzcsjRHRrLi/r6OCyxWMVqdzEGQCmbPA3iU1s84tjhNwk
X-Received: by 2002:a05:620a:4110:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-9494bc2891bmr301535385a.51.1794561877082;
        Fri, 13 Nov 2026 01:24:37 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-9494bc2891bmr301532785a.51.1794561876585; Fri, 13 Nov 2026
 01:24:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com> <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:24:25 +0100
X-Gm-Features: AclHuK_hWgvOcF4-vUl_u6aNROFwx2WEFwACIACntrI_XmAAh3LwfT2j2M9oizI
Message-ID: <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Subject: Re: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6d756 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=4gFQjZcglls1U0HB3AkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX/voiP+9zTN7/
 X8cxuyPOgwvLLov1kVB/v5w2J8tjbuNr3hbS/ZSmywPh2Bvz+lTQeDc7FIyP28XABfw/XzJFkIM
 1KPUEEq5hywhfu0+EakMkaF02sWKpFljItyP8fyAJzIJIX4LOaeXDFwVmAafJhhVSFiKFcNp+QX
 LoigKw98dXh6luT5pgR+JSRxl8Klk3XZ/PAA0sE715NxaIyDHad6YFUKXAH6mCUYkLYb3wygE7F
 pC976nDqS8Y8AD5GdvX5u+HbBm+JWIIMMI1JeTOqkJaZfeZD9pm7Igi0v5ka2rsdduSVVB9wE09
 K7AL54CeZ4C/kfmOVZxd2xeYykd7aNtTO3XGVw6ZBh5Wr674pMx5ndVxHcE1oTZ/H0YvXsYLUqI
 tXvLBWuJ2fN73IKQVL+xNdan8GSJy6SzKgnvz8e9SgiamwSyp8rN2EWDF3MwiKkLZD0RiOspoXy
 DI/7QfOqaON+PBm6M7Q==
X-Proofpoint-ORIG-GUID: ETWt4fJ-Xl0s9PiS8fj1SO1xDuCFuLix
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfXzmRtj67bnTnb
 kQjBv28UoWGNqBcDcGYCjbioh5m75DMecvH4dg6hUt4rorsvxpUoZpf4cRlP1NwdSkMinQ9v1Rf
 Tjo1Atgd3YvYgyMy2nTVNfLuP8KECvU=
X-Proofpoint-GUID: ETWt4fJ-Xl0s9PiS8fj1SO1xDuCFuLix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_012438_884966_0B4002F1 
X-CRM114-Status: GOOD (  29.40  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 12:26=E2=80=AFPM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> Recovery monitoring runs on workqueue_aux, which is also
> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>
> A single firmware crash may generate multiple recovery
> triggers. Recovery detection currently handles each one by
> waiting for recovery completion on workqueue_aux. On SDIO,
> this blocks the same workqueue needed to deliver recovery
> traffic, preventing recovery from completing.
>
> As a result, otherwise recoverable firmware crashes fail
> with:
>   ctl_resp never came in (-110)
>
> Treat duplicate triggers as part of the same recovery attempt. Use an
> atomic compare-and-exchange on pending_recovery so only the first
> trigger starts restart_work.
>
> Convert the recovery monitor to self-rearming delayed work. While
> recovery remains pending, the monitor periodically checks its state
> without blocking workqueue_aux. Cancel the monitor when recovery
> succeeds or the device is stopped.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
>  3 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..82bb0bb72dc7 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
> +       int fail_count;
>
> -       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> -        * so avoid infinite recovery.
> -        */
> -       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> -               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> -                          atomic_read(&ar->fail_cont_count));
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
>                 return;
> -       }
> -
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
>
> -       if (atomic_read(&ar->pending_recovery)) {
> -               /* Sometimes it happened another recovery work before the=
 previous one
> -                * completed, then the second recovery work will destroy =
the previous
> -                * one, thus below is to avoid that.
> -                */
> -               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> -                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> -               if (time_left) {
> -                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> -                       return;
> -               }
> +       /*
> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
> +        * cycle. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
> +               return;
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> +       /* Record the continuous recovery fail count when recovery is lat=
e. */
> +       fail_count =3D atomic_inc_return(&ar->fail_cont_count);

I don't understand why we need so much complication and the need to
count and restart this work again, why not simply scheduling the work
or a timer at the final expected timeout instead, then if we reach the
timeout the device is simply marked as wedged.


>
> -               /* Avoid having multiple recoveries at the same time. */
> +       if (fail_count >=3D ATH10K_RECOVERY_MAX_FAIL_COUNT) {
> +               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> +                          fail_count);
> +               ar->state =3D ATH10K_STATE_WEDGED;
>                 return;
>         }
>
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);
> +       /* Recovery still in flight; check again later. */
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle. Losers do nothing
> +        * while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Start a fresh failure budget; the last cycle may not have comp=
leted. */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       queue_work(ar->workqueue, &ar->restart_work);
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
 struct device *dev,
>
>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>         INIT_WORK(&ar->restart_work, ath10k_core_restart);
> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_wo=
rk);
> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_=
check_work);
>         INIT_WORK(&ar->set_coverage_class_work,
>                   ath10k_core_set_coverage_class_work);
>
> @@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>  void ath10k_core_destroy(struct ath10k *ar)
>  {
> +       cancel_work_sync(&ar->restart_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>         destroy_workqueue(ar->workqueue);
>
>         destroy_workqueue(ar->workqueue_aux);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..e8fcbef38ca6 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1207,7 +1207,7 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..3c45e5483b60 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, b=
ool suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
> +        * recovery state after the works are cancelled so a later
> +        * ath10k_start() can start a fresh cycle instead of being blocke=
d
> +        * by a stale pending_recovery that nothing will clear.
> +        */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       atomic_set(&ar->pending_recovery, 0);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee802=
11_hw *hw,
>                 ar->state =3D ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
>
> +               /* Cancel the monitor first so it cannot bump the count a=
fter reset. */
> +               cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>                 /* Clear recovery state. */
>                 complete(&ar->driver_recovery);
>                 atomic_set(&ar->fail_cont_count, 0);
>
> --
> 2.34.1
>

