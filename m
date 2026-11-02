Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C360A2605
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fbkcx9db;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuL85fN7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q/OaqHtK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=; b=Fbkcx9dbDp7YH8
	msv8Pzdso9d+6/HYfpX8Yd0l2DhM7B6OqM0YLLKMssRrP6v9HLbo6qKa4bky3V5376E2qBC6mQQtx
	Jl/W+6aqiBWLouUA4+2zGMSwpHGTTyuG9PLFzscV/Ct+beGZZ3qDbXjja6JdKW9G0365cWt9KWKa4
	/Y7SBOfkcUUJH2p/HSIavk4P4g7JptxnZ2iEoQnORkvNXQNkkV7alxb42dIwlsW+ID/PbawIJ6xrn
	Be83uC4HbC07TYovy7Z4jtRahH+uTCsk33G+hsMeSfz1TVfdpZjwlnPHlrMboZdfuKy9tPx1ecam3
	cI9zqrm0MF6rm3lDNazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqvU-0000000GQDq-3XFv;
	Mon, 02 Nov 2026 12:14:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqvS-0000000GQDV-2zhb
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 12:14:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7fE214023
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 12:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=; b=AuL85fN7LCS4BdlZ
	bNwaPpw3VJWzjsI7E2FfuzsmKmcdWbWF0LT1GP+M5e/z3pw6Gp+W/S8ASjymPQXa
	grIMglL+rdT/FYgmOWDNCYXds/zBQohJvGzE9eRdyo5tumQttuyKbmRCPQNzMt86
	W0l+i84Bfon6Mc9jC72zEsqOBTZ73EyloEEF1qMMxyZUI71Ywu7jHsk9QX7IwQKV
	HHrD3yZmeCiJoxDnJJ/gOmPtlRfDhqhcvQQcsQ3tw4qgrCFuLcqYQIG/c0pZp4VR
	WNDkqtRDkM4Ilq5EPVl3JyhaPdunf7qsEGdnftYeY5rxBmEqoKs5W3nAWpwDWEOF
	3TSiJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1shf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 12:14:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so530953085a.1
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 04:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793621649; cv=none;
        d=google.com; s=arc-20260327;
        b=kjCn5HK2IctTEylXtZoR6hF4lBsw4JHXodLMGLT343pVN48l6gsBd8bNT7Sk85OgzD
         D0BGwI32Bn8360m1lwxWAXphkjpN0odUsFY6dysLk4UsoPtXqDlBDO7UdkxkTG5kJFxf
         V2QIDYucio8MtOZHV3BGkS/oe5ysHPzTANiU6mMUAQl0csgmaqOzxlWdHtQ24gb3/N6e
         xgI0+LgUOtZi2Xm8+LB8WzOxWK1iS6KVagX8Iewp3WXcEXyBaVpVu9WbLsu5fcq50Blb
         uLIr6QmcSbQXKFPIjwt2+tdOLf2I0/x6djLBD5BUCXjPH2hNguXWD89PYtAxqUyQI4BN
         Sz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        fh=4oCmdGoSpYm1GzQ/RDLKN8XHi4EVz/aNjvyUaMtTmsg=;
        b=XEq1Bu4fg40IvVZelpMHpuJ8XtoXt41Hq3NTjB6d3GoaDaMz7steYwzevph0e7b6Ck
         DOm8Pi9viVwY6hvOzpV2I5b/K0EwBfw3M6So02ercQfYaXFI1O3oylh/UaKztqhtxD42
         WAsmmUco2rIedgu3GQbrMN1q7wZX+a8bWUZvmRZ8tLY20KtPcGKySGDd+jCpcsdqFYXo
         q7Sz+hsqgZ17WFWaGVNxsvQETgcplPIyngJpJ9AEoCGo3PIzKxBEGfIVBq+T8HHWvCpt
         5Am6qiOgN9ov2LS3YpxeKRz/DPG3wEiCKG7aeVB3NQS78gnh5P12U1Cc/h1/DLdRH6OH
         6YRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621649; x=1794226449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        b=Q/OaqHtKjMOxG0FFEa2Jfr2d/VoBAAQPARUYGas2J9bxb/ovlhIO1AK22dDaOwdFSl
         WAbRrBME9YC0iKVwLGa8xXLdFTDwhSVwXDq6p/qel/WCNsTiyIFUcT0iiiW5dl0v9yjV
         DaLL1y50nM3hy/otKRXV9A6hpESQ4i8wmuNt/ibYHwTb5nKjF2MPQrbWh+sItSkr2nbX
         CBij1oqFAsSJmZdpeeOWHHCWsV95Gc8S66Zx/nA3cEnRREElHevlxZU7RvYbEYCyQIr1
         oVSxXoMmL4vlabIYnfBs3JnogNbZHnCUodZdgzBhbBkK5OL80pt3879lD9W+H9tyruwe
         0z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621649; x=1794226449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        b=jSpuKLjO8tPjrTy5lb7p1f1z3Q9Zqqoim9dc9feZ6VB7pZBpnwKw2VhsVGvAxH9IPw
         ULL1KbZGvwJA3UVaxAhjAz79PPvYOLXyz4eRwIrxx248xxTwzbbhfvdU8vuTBt6uxyFn
         L65qLV6vkKbUXwLFRMCLIOom70Vu8m+ZBVPIGSaHrxtQ2rSNKwkOAwFxD/sZHK3F0iDh
         w/gZSkJRkm8FOBlReiG6kCTaehLAmohTZTJHQ7OuLYTYW4APVmwrAokEEYvJ1ofXiEhV
         KYuM/9ZIknnV0rflvE19FTDmoMIpiBBFQDwafO/MEdl8JswqlE/TqghoA2Iz1/nfsmga
         Ptog==
X-Forwarded-Encrypted: i=1; AKwUvBzicL72eR1Vo4SjM1BpOt5iexfQoBQ6hDq9ZOJqJfVZaLi1oV23FW93aojW/PFOjCNCU75qX4s=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6MMcAgfwEBEz6cIO8fj0G30fejhk7QiLSlrq90mHCD+F+EfFn
	hGfnovh7nx56liQgtY/ZN0l+JvKZW7FgL1GnBesk0ZUFRv0t38JddwNkCpa4FMeclpt5y1sez6I
	5TlZxRS+sCvzlAE463lIZzxd1D8A+Z935+PFko5ZBA3pYZeBJ4T/BRB48kgkbdP459KaYgek6mW
	ww/blxJKrBk4/kR0NjmRBj0ut68MRDYSIzC7a4GMjXEEIs6T1TPtnD
X-Gm-Gg: AYBFou0XlXxMCwg2n9Cbd8eXXMmBroSKqfMDlOKdOEKVR9WuYuPub3v/+f9wjl9EIXN
	10kp8Nljtgh+bLMFNrv8aEbfsCCkQsp+vgFX9GVXBQWjAUM3G9OYxnfC3M+33Sz5N0EkC6F8Obb
	CFlKCQ/3Hfn/neHD5UmoAU1w4RmsdIY/97tSee8ZLDUhSXBtOq/DGvLljMtKQnj2Rf03fIZ0aOG
	vQ8ewp6exOWbRG8WQI9QTxH3cvd25Hw1ZjunXUlg9T0SxkmCkcK5t1osWx5dR1V6H07I1L5oIE=
X-Received: by 2002:a05:620a:a999:10b0:945:b1a7:fe4f with SMTP id af79cd13be357-945b1a81c6bmr414534485a.41.1793621648974;
        Mon, 02 Nov 2026 04:14:08 -0800 (PST)
X-Received: by 2002:a05:620a:a999:10b0:945:b1a7:fe4f with SMTP id
 af79cd13be357-945b1a81c6bmr414531685a.41.1793621648418; Mon, 02 Nov 2026
 04:14:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101164247.258200-1-julius@bairaktaris.de>
In-Reply-To: <20261101164247.258200-1-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:13:57 +0100
X-Gm-Features: AclHuK-mJLI3vhrxkV6Cb90_ogt0oCov9vd_N4l2QccyJhxGU5TxIqOa6IopJaY
Message-ID: <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: EDijhK0XLAsKzaOI8oo9-eFa8Jd7I8fk
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87e92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=-bX5D0ki1FL7K08LthAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX2cHHbKMRDSF/
 8FqSJZla360kO3R1h+AQbVkdBZbtMcxbD1fL5g1+1SSJbfny/zgBDfrSdlu1b11Y9um3Nm6a6zX
 jgZGHEZgJLWp6iWpt/eD2S4sKTvJMf/bOZGMU7aT6cteyN25ieUJHXZ2+OGRAzQNiensv4shIk1
 pr1JlXnkW+xJxgfZVvr1BBsNgvMlISTrk/NTFKFVMRmh9tZDABBLQaUY4J143HBT4msBxvU18TS
 UhKVWW5KscowV4jyU5yspTRGVF1pzc/JmUaKdiNy+bVI+NrIbmoSO97Y7k7ktvgUv2rypMXw0Kj
 TxGAkDrarySkrLYGP2J6+KE1ptCZQxg4llqpLLz+D2Kla1B9ZYAbXvpYD5nv28sQSmTb3G0plPe
 efpnza/x+lXgRiB+8i8wbieTQLjhIr3Jf053OAFSHfHNBeM51xKubavwkorNDDkoErHukQt24x7
 8W0DIBaCo/8sKPqI2oA==
X-Proofpoint-GUID: EDijhK0XLAsKzaOI8oo9-eFa8Jd7I8fk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX/Y2ghPWbla2p
 6mZSfDVkrMu9ofD+CrJewldUKIUP09ZdiVyc3Qlh7P/vGttLg14fEvDuiO+o9M1owWe++xs4NIk
 lASGrwnyxsy5R7ODpqyo/hRYh9jr0mc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041410_784271_9C9E9D9F 
X-CRM114-Status: GOOD (  35.70  )
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

Hi Julius,

On Sun, Nov 1, 2026 at 5:43=E2=80=AFPM Julius Bairaktaris <julius@bairaktar=
is.de> wrote:
>
> The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
> Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
> Message Capable 3) and, when granted all of them, raises the firmware
> interrupt and each copy engine on its own vector, the layout ath10k
> used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
> Since then ath10k asks for one vector, so all its copy engine
> interrupts and the NAPI they schedule run on one CPU.
>
> Ask for as many MSI vectors as the device offers and spread them over
> the CPUs, starting each further device on the next CPU. Every vector
> keeps the shared handler, which schedules the NAPI that services all
> copy engines, so the copy engine to vector mapping does not matter for
> correctness. With one vector nothing changes.
>
> On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
> the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
> and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
> softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
> Measured with idle-priority spinners, the CPU time of the whole system
> stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
> uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
> crash forced through debugfs recovered as without the change.
>
> Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047
>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> Tested on OpenWrt's ath10k (Linux 6.18 with backports 7.2) and on
> ath10k-ct with the same change, where the DesignWare PCIe MSI of the
> IPQ8074 lets each vector run on its own CPU since commit eaf290c404f7c
> ("PCI: dwc: Enable MSI affinity support").
>
> I used Claude (Anthropic) to help write this patch.
>
>  drivers/net/wireless/ath/ath10k/pci.c | 64 +++++++++++++++++++++------
>  drivers/net/wireless/ath/ath10k/pci.h |  3 ++
>  2 files changed, 54 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488..4de789cd06 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -38,6 +38,9 @@ MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi =
(default: 0)");
>  module_param_named(reset_mode, ath10k_pci_reset_mode, uint, 0644);
>  MODULE_PARM_DESC(reset_mode, "0: auto, 1: warm only (default: 0)");
>
> +/* Spreads the interrupts of each further device from the next CPU on */
> +static atomic_t ath10k_pci_num_devs =3D ATOMIC_INIT(0);
> +
>  /* how long wait to wait for target to initialise, in ms */
>  #define ATH10K_PCI_TARGET_WAIT 3000
>  #define ATH10K_PCI_NUM_WARM_RESET_ATTEMPTS 3
> @@ -1943,8 +1946,10 @@ static void ath10k_pci_irq_disable(struct ath10k *=
ar)
>  static void ath10k_pci_irq_sync(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> +       int i;
>
> -       synchronize_irq(ar_pci->pdev->irq);
> +       for (i =3D 0; i < ar_pci->num_irqs; i++)
> +               synchronize_irq(pci_irq_vector(ar_pci->pdev, i));
>  }
>
>  static void ath10k_pci_irq_enable(struct ath10k *ar)
> @@ -3164,18 +3169,42 @@ static int ath10k_pci_napi_poll(struct napi_struc=
t *ctx, int budget)
>  static int ath10k_pci_request_irq_msi(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> -       int ret;
> +       int cpu_offset, cpu, irq, ret, i;
>
> -       ret =3D request_irq(ar_pci->pdev->irq,
> -                         ath10k_pci_interrupt_handler,
> -                         IRQF_SHARED, "ath10k_pci", ar);
> -       if (ret) {
> -               ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
> -                           ar_pci->pdev->irq, ret);
> -               return ret;
> +       /* With several vectors the device raises the firmware interrupt =
and
> +        * each copy engine on its own one. Each vector schedules the sam=
e
> +        * NAPI, so they only differ in where it runs: spread them over t=
he
> +        * CPUs, from a different CPU for each device.
> +        */
> +       cpu_offset =3D atomic_fetch_inc(&ath10k_pci_num_devs);
> +
> +       for (i =3D 0; i < ar_pci->num_irqs; i++) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               ret =3D request_irq(irq, ath10k_pci_interrupt_handler,
> +                                 IRQF_SHARED, "ath10k_pci", ar);
> +               if (ret) {
> +                       ath10k_warn(ar, "failed to request MSI irq %d: %d=
\n",
> +                                   irq, ret);
> +                       goto err_free;
> +               }
> +
> +               if (ar_pci->num_irqs > 1) {
> +                       cpu =3D cpumask_local_spread(i + cpu_offset,
> +                                                  dev_to_node(ar_pci->de=
v));
> +                       irq_set_affinity_and_hint(irq, cpumask_of(cpu));
> +               }
>         }
>
>         return 0;
> +
> +err_free:
> +       while (--i >=3D 0) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               irq_update_affinity_hint(irq, NULL);
> +               free_irq(irq, ar);
> +       }
> +
> +       return ret;
>  }
>
>  static int ath10k_pci_request_irq_intx(struct ath10k *ar)
> @@ -3212,8 +3241,13 @@ static int ath10k_pci_request_irq(struct ath10k *a=
r)
>  static void ath10k_pci_free_irq(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> +       int irq, i;
>
> -       free_irq(ar_pci->pdev->irq, ar);
> +       for (i =3D 0; i < ar_pci->num_irqs; i++) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               irq_update_affinity_hint(irq, NULL);
> +               free_irq(irq, ar);
> +       }
>  }
>
>  void ath10k_pci_init_napi(struct ath10k *ar)
> @@ -3235,9 +3269,12 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
>         /* Try MSI */
>         if (ath10k_pci_irq_mode !=3D ATH10K_PCI_IRQ_INTX) {
>                 ar_pci->oper_irq_mode =3D ATH10K_PCI_IRQ_MSI;
> -               ret =3D pci_enable_msi(ar_pci->pdev);
> -               if (ret =3D=3D 0)
> +               ret =3D pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_M=
AX + 1,
> +                                           PCI_IRQ_MSI);

Why not simply using pci_alloc_irq_vectors_affinity()?

> +               if (ret > 0) {
> +                       ar_pci->num_irqs =3D ret;
>                         return 0;
> +               }
>
>                 /* MHI failed, try legacy irq next */
>         }
> @@ -3252,6 +3289,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
>          * synchronization checking.
>          */
>         ar_pci->oper_irq_mode =3D ATH10K_PCI_IRQ_INTX;
> +       ar_pci->num_irqs =3D 1;
>
>         ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_A=
DDRESS,
>                            PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_AL=
L);
> @@ -3274,7 +3312,7 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
>                 ath10k_pci_deinit_irq_intx(ar);
>                 break;
>         default:
> -               pci_disable_msi(ar_pci->pdev);
> +               pci_free_irq_vectors(ar_pci->pdev);
>                 break;
>         }
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless=
/ath/ath10k/pci.h
> index d114778edb..252044dd63 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -115,6 +115,9 @@ struct ath10k_pci {
>         /* Operating interrupt mode */
>         enum ath10k_pci_irq_mode oper_irq_mode;
>
> +       /* Number of MSI vectors, or 1 for INTx */
> +       int num_irqs;
> +
>         struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
>
>         /* Copy Engine used for Diagnostic Accesses */
> --
> 2.53.0
>
>

