Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC3606A321
	for <ath10k@archiver.kernel.org>; Wed, 11 Nov 2026 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IxmaSJoG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aRQglqVZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rbanhac8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=; b=IxmaSJoGy+g8FA
	z54yAdzCobYlbY2I5duaGpcI/KDd1lMKtBVlrNMjJzQK3e6ozGIaHb60g0IHrSu9SMK8f023CEm+c
	8P2kziKtdrv7N1zXv0qd5x8IsLIyc1lHmv5kaZhcyfK1+/PaPV2pZ7jeYX7tYPyO9IHd5iG6eTbXH
	YmznDeOoyppOzjuHzmzQN5eiRXGpd3rnIaQLs0n1loKYqd7BFFqCFBKvvBLA85MRLsUu0xMOzo0AQ
	uJ2xxfYTBJk3bbt5RriQANgeGdHNhoCKi3XroTL+uzRR6xzL4W83S8b2faR458SE4LAZ8EKm6hZgo
	D38psI3elsR1wzpoyNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBDi-00000007COG-21jR;
	Wed, 11 Nov 2026 16:30:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBDg-00000007CNv-3C5x
	for ath10k@lists.infradead.org;
	Wed, 11 Nov 2026 16:30:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Zw92594124
	for <ath10k@lists.infradead.org>; Wed, 11 Nov 2026 16:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=; b=aRQglqVZ/Wv0RMx2
	YktCbDiQXZ58TE284J5LEt4oyVR3DB99T5lk89sEjeochr1cM4fnAXUYjxMKDiuI
	mu4oCNpeRKLDgIgFoVODLR7Gj+72Q9wQ2mUb48UYkjlXcuOLxSxQss/Ew4lAIAfF
	FUIgzIOEh1EgsrrYMP5yDwRLDMLxw/9cbhMMNMOT4kH4jlzOii4ZDDRaPGviOmGu
	1CVt0Z7/2rx6BnKeXtyH06NlDWhS+3iHJXqQy0/ZMoMh3KR3TSGa5zDrqnKSy952
	SuyqG7S8nxou2tiulvz3K1O1Cw0jjaKZPFfnkaH+x1Dd0pSOFpowpWkbbJ00VLsG
	MK2RUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma4f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Nov 2026 16:30:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so690366085a.1
        for <ath10k@lists.infradead.org>; Wed, 11 Nov 2026 08:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414642; cv=none;
        d=google.com; s=arc-20260327;
        b=D028wCtRoieWxlOZlVwhcAPePxcFtsleorYgv+l7NorLe8b9chZm0aMMv3FmG7of1K
         usIeC887Fw8vCMK33lvlX3/vh3vmA9/wsKMgDAhaR+LKGANgrHhEqkQ+l2dTB0Uz1cFW
         KuGc/sZMpQIsg5ZqndpXRArD9NDfltzr0liKvoeI1jmKm0M/EjjBOHwG5NGXXKabTjwM
         ue0N1j6joUXpu/2qegrrz4ZfO9v474ZLfo0BpN6Qymwg7YaD1rCDG3cfyskBXhGq8vTN
         azlrUc5vP5wKHKIM2cNkSSTel6Hpy4pbu52zXzc/P93h5d23wdov4tuDN+k9D+o0W3tN
         ET/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        fh=rvj3LxrZ4VO/iL+4Tgd0zSHJMrKvLZh+9T2MxTR0Is0=;
        b=Csi7I2Op9gqWJZJWmP2j1Amphodjwc3jxkHJZozsgjcX+zKv/g+PNiUK9de5xg/eIe
         PwYO1jqnHLP/yTjvH5ZosiDxFX6Dxu+H5rBfmSH2/iu35NCRp67eBwIzbzNQf6U0fasU
         rZHflVY122xb6cvDXaitr4OSEe5QnrigEAZFxlH5Bd6IgUNzTn/QWamcCDLx9Ev8ENC+
         ILupzwH9rHDIri+HXyALEhiCc2AFStv1IHoIMcrTPkndCUVqbbsOWABoL/iLqU1GQSe4
         BZGmfIvdp+Ix3HPLXakwfZTP7f9bdWAJ97WxUBtN6uDYK9B8KxMuzEplNk4p0Fi+vqfc
         mT+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794414642; x=1795019442; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        b=Rbanhac8widj2gvF8F06DuVpbpS09aW+5EOPl0SZARzMSlk/z0LlOFfOXyNC3DCgx6
         SlQg2W0gXKF89U6N2fcrOStkrZEDZL6dVT86eKAT8PMd0JvYhV4qQBHFfhhB/JJbjy3q
         U1oxB8jProC4vyvbDapbpuusD4XXjgjW5k5IFtMSEjwmGVE4ler9r7dydwcpyT8b31dy
         qgh2m4asN84PotqtDqj5446oJfrB0N356FVlOH6Q38eShXUnLgKPBFUut4euIqmHeaXI
         F4vCO2Be+DvW2PACSI5TcZuiF3VPK6JFKEj/QIGx+TysRcj20cMyHhmY5jgtjR6tnasG
         hECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414642; x=1795019442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        b=WRMlDdkC2z1m7hPaAyge+K/2OlSvPNJdmRJsDnpopU+IKHa9pcnLXv+f/9LDnNg5L2
         qlsUv1qXPU80/12XcBXIs0lsj370e0cTo4DssdPow1SApUA+5J4QLj844quSgIpot7Gy
         CmvbeeeHhb1KA4a8cTXAcE/RH3H+zkaLZ+0nqnJnGwb3yRAs95K90UrbxMmd48sLpcCL
         Hq1zJ/ohjXNOSmrOTRruqz7NPWDKuEPMuSOP6/c+ePvq+/oQZg8k1HrWLTVdmgbXSH6B
         gKFFp9fjBidWtcjRokwedzMe26JQ9MVL6KofQkHNG5dppa1myo0dzEAwqpZ/tgajeZjU
         jqNQ==
X-Forwarded-Encrypted: i=1; AL+hErE13UpjYSUBUe9cre9OYU15PZQvgY5TBbnGKKjo319Fplx3Var2Bild6pY0+2kuOAVixniml7k=@lists.infradead.org
X-Gm-Message-State: APuU4Z8fYEIiySPiXZ/lPdmqgatQzl0OkN6wmelT6BJrWd70Hd5yTqiG
	BKlvKMyfGBmezaB+WuZH0WkrizPqYJaoSNpjteVnrx1SmnOexlyiZptlHTqcGFUDkRss4TxDIFN
	1TVsFPeBHcLNsnA8Z8mdNQPyJxMEAwABcTcdAYS3u2xwIIzkm+Z03rPhtnOCm2GtCo76axVg6i3
	nbn66hAbYK2GL1or9LM0nNLWwkrem8Y2oGFzzFzxI=
X-Gm-Gg: AYBFou20wuISTBcdgbzx88U28jZ5jaAMT/4UyvX72BGB58as17uBZsTuYFYrF+vsjp+
	AKdJa3kBIkyQaLAejymM9i7Eas4YqDrFftJMLdDiBytD1rwuiHaAWbLbLoXNWdOQoWmkQ2dfxog
	hCJhaqf5wYnix+WKNiHbxs7jTBq3+jR+9AngBWceAHnr3p+U0ctfhu6g9qV8xUFJNIQhZCl7Zh8
	2Vmytx9R1viTCnTaKeMUuWY6aDQU1AnYrW7qWGfIhoOSpG3uKJp5r8QCEzuoQoUN5Z3AnNoPXH/
	iuP4Xdh/SqtSQJqdb9Nh3mPVqLU=
X-Received: by 2002:a05:620a:6c01:b0:947:7f5e:2b63 with SMTP id af79cd13be357-947b003de74mr446224285a.34.1794414642166;
        Wed, 11 Nov 2026 08:30:42 -0800 (PST)
X-Received: by 2002:a05:620a:6c01:b0:947:7f5e:2b63 with SMTP id
 af79cd13be357-947b003de74mr446214285a.34.1794414641405; Wed, 11 Nov 2026
 08:30:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com> <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
In-Reply-To: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 17:30:30 +0100
X-Gm-Features: AclHuK_23C9yhGbenZKbQGi2zAu-gPm_Fk9HJBo5HPAoIFCAUkkHa4BtoGtVqdE
Message-ID: <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MnYGyUkIzdMxvfDiKDJU5fG79wY0w7_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX3kHSwHww0rZj
 xYrsyMVhYbw3lBXh7jfY5vAsMr6pugU20bAMgScWsCy+aNp6TwT3Bdxntm/sC7sMuP83hraKdeZ
 qaHOBZSSUawHP9xhb3exmsILg+oNwe0hYFO/Crlg0sZUzood5LndXUweqgRLlNFeSgeQ359mEyL
 HYXqSWGcmCcsPwUvLUrWlhmL9Y8QH6AM49xYasYZ4l+GNKCoeq0mVOygx6phvIMf/UaFXYLl3UB
 Nya+nrPQYEnFwqj4NmDNlwacIfdnksB1LvK7o0OXIXXq08WHexyu9Eba8RJRNRZUR+ZrkQJdx6X
 ohrSA9W5FhxTwHPCTULlGfW+9s2VQzdz5d5rS4CjHvnxEm8bUo38Ny1tD0pbbsrwcIhdNGEH4Hu
 MClCh15F08BhjuzI6hlUTVYd/TiQZXDBQc5XT7+4obLayNexUs5VG9mnD/x/XKMAGGIkUqT+89r
 lSw3AcpgYAQNdJgaXKw==
X-Proofpoint-ORIG-GUID: MnYGyUkIzdMxvfDiKDJU5fG79wY0w7_0
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49833 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=PFt12ZtUnVRDP-aAo5UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX1MZQHpiMCCTN
 C/KwfQnnfXsmN3yBH58dp3z4RemjHfDq/aqiAdVi07eBlh4ep6GZ8axPG9rRvTeYi5XkJ/I9lzF
 waAVdm7o/3WGBdGRHVFJCcE9Y/vxnkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_083044_808460_C82513BE 
X-CRM114-Status: GOOD (  30.92  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nicolas,

On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@gmail=
.com> wrote:
>
> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> > codename nairo (SM7250) never sends the event, so every read of
> > temp1_input stalls for 5 s, logs
> >
> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
> >
> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> > lm-sensors, hang for 5 s on every run, and configuration changes of the
> > interface wait for conf_mutex in the meantime.
> >
> > Whether the firmware answers cannot be told from the chip: firmware tha=
t
> > answers and firmware that does not both advertise
> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> > Instead, remember that the running firmware did not answer, and return
> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
> > starts, so that a restarted or updated firmware is asked again.
> >
> > The first read after each firmware start still takes 5 s when the
> > firmware does not answer. Reads on firmware that answers are unchanged.
> >
> [...]
>
> Hello,
>
> I've just now seen this and it will break some setups. It seems that some=
 ath10k
> devices that usually respond to the thermal WMI messages sometimes do not=
.
> This is from a QCA9888 that does not have your patch yet:
>
> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
>
> Like you I have a daemon that reads the sensor periodically and it seldom
> fails to read the sensor value for whatever reason. Most of the time it w=
orks.
> With your patch once I've hit this, I will never have a valid reading any=
more.
>
> So how about I post a new patch that only fully disable sending when we h=
ave
> like 3 consecutive read fails, and in the mean time I can also lower
> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too =
long ?
>
> Jeff / Loic is that ok or do you have any other suggestion ?

I'm not particularly comfortable with such a solution but since we're
already introduced a workaround, I think this is an acceptable
approach.

Would it be possible to implement the retry loop directly inside
thermal_show_temp()? A one-second timeout seems more than sufficient
to read a thermistor but it would also be useful to include some
information about the typical read time for this kind of request,
along with the timeout change. I assume the actual read time is well
below one second.

On the other side, since you've been experiencing sporadic thermal
reading issues, have you also tried increasing the timeout to see
whether that helps?

I think including these details and any relevant measurements in the
patch description would be valuable.

Regards,
Loic

