Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C19AC04FFE
	for <ath10k@archiver.kernel.org>; Thu,  2 May 2024 04:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dru09+lVCEJ/focetGsa86snmDj0Jie80DC0sMtqhCk=; b=266LuwQLx2b/p7XAi9Iv4p97UR
	2gemL8J/KL3LlebzPZqBehcwcHC208/nIkpiOvZ4/AnK4+e9jRVOVHAcWFQaefpVLiL580HwBkTqq
	tK4TZ/2d7P2NIXeWCJKJOvWsGmT4eD1Wcagi2ElDGGrcg8urxMkIU+lv2SQNM/tlqU0tpCtrGtFKd
	uaaaJGg1Zpj+hTXBYoqGOdZKKJpWzi9aos9ZvQrCeWqaAdxaE4dlMWf2PGPOezu4ocum3cI33QNw7
	UA+J1IdBa5QDF7ox0dSV6b0GyF9X3nDvmu9rrUE+AH595WjkY77YaUbwWs92rkifG0ebq+wS1elTm
	xGURniNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NzJ-0000000BPoj-1nDs;
	Thu, 02 May 2024 04:24:05 +0000
Received: from [137.220.190.183] (helo=mail0.jo282.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NzE-0000000BPlS-2dAh
	for ath10k@lists.infradead.org;
	Thu, 02 May 2024 04:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=jo282.com;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@jo282.com;
 bh=dru09+lVCEJ/focetGsa86snmDj0Jie80DC0sMtqhCk=;
 b=D5y7T5Ne0fNHFhK0rPiECSLeWJIbzPT5DGqP6SoCYpyTGSDy7aCoC/yaVaaTS+bilojCDFmk5tJY
   NYv5h8AUnkqJfIOACAx4g/VoU+ya9k6SQ2vl5j50LFn1YxMp2wXoBfMy0i5EsvdAXNqBPDEhAhHh
   Lsh0sWxTozicX3UJ2E4=
Message-ID: <6cb91b6f50d6a8efc0302a023304b86c@jo282.com>
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCB5L+h?= <no-reply@jo282.com>
To: <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ5LiJ5LqV5L2P5Y+LIOOCq+ODvOODieOAkSDjgYrmlK8=?=
	=?utf-8?B?5omV44GE5LqI5a6a6YeR6aGN44Gu44GU5qGI5YaF?=
Date: Thu, 02 May 2024 12:23:54 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_212401_222574_21C425C2 
X-CRM114-Status: UNSURE (  -0.25  )
X-CRM114-Notice: Please train this message.
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

=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B =E3=82=AB =E3=83=BC =E3=83=89=E3=82=
=92=E3=81=94=E5=88=A9=E7=94=A8=E3=81=AE=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=B8=
=0D=0A=0D=0A=E3=81=93=E3=81=AE=E3=81=9F=E3=81=B3=E3=81=AF=E4=B8=89 =E4=BA=
=95 =E4=BD=8F =E5=8F=8B =E3=82=AB =E3=83=BC =E3=83=89=E3=82=92=E3=81=94=E5=
=88=A9=E7=94=A8=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8D=E3=80=81=E8=AA=A0=E3=81=
=AB=E3=81=82=E3=82=8A=E3=81=8C=E3=81=A8=E3=81=86=E3=81=94=E3=81=96=E3=81=84=
=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E4=B8=8B=E8=A8=98=E3=81=AE=E3=81=94=E5=88=
=A9=E7=94=A8=E7=85=A7=E4=BC=9A=E3=81=8C=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=
=E3=81=97=E3=81=9F=E3=81=AE=E3=81=A7=E3=80=81=E3=81=8A=E7=9F=A5=E3=82=89=E3=
=81=9B=E3=81=84=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=E2=
=80=BB=E6=9C=AC=E3=83=A1=E3=83=BC=E3=83=AB=E3=81=AF=E3=80=81=E3=81=94=E5=88=
=A9=E7=94=A8=E3=83=BB=E8=AB=8B=E6=B1=82=E3=82=92=E7=A2=BA=E5=AE=9A=E3=81=99=
=E3=82=8B=E3=82=82=E3=81=AE=E3=81=A7=E3=81=AF=E3=81=82=E3=82=8A=E3=81=BE=E3=
=81=9B=E3=82=93=E3=80=82=0D=0A=E3=81=94=E5=88=A9=E7=94=A8=E6=97=A5=E6=99=82=
=EF=BC=9A2024 / 05 / 01      23 : 18=0D=0A=E3=81=94=E5=88=A9=E7=94=A8=E5=A0=
=B4=E6=89=80=EF=BC=9A=E3=82=BB=E3=83=96=E3=83=B3-=E3=82=A4=E3=83=AC=E3=83=
=96=E3=83=B3 =E5=8D=83=E4=BB=A3=E7=94=B0=E4=B8=80=E3=83=84=E6=A9=8B 1 =E4=
=B8=81=E7=9B=AE=E5=BA=97=0D=0A=E3=81=94=E5=88=A9=E7=94=A8=E9=87=91=E9=A1=8D=
=EF=BC=9A9, 580=E5=86=86=0D=0A=0D=0A=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E4=
=BD=BF=E7=94=A8=E3=81=97=E3=81=9F=E8=A6=9A=E3=81=88=E3=81=8C=E3=81=AA=E3=81=
=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E4=BB=A5=E4=B8=8B =E3=81=AE =E3=83=
=AA =E3=83=B3 =E3=82=AF =E3=82=92=E3=82=AF=E3=83=AA =E3=83=83 =E3=82=AF =E3=
=81=97 =E3=81=A6=E3=82=AB =E3=83=BC =E3=83=89=E4=BD=BF=E7=94=A8=E3=81=AE=E8=
=A9=B3=E7=B4=B0=E3=82=92=E7=A2=BA=E8=AA=8D=E3=81=97=E3=81=A6=E3=81=8F=E3=81=
=A0=E3=81=95=E3=81=84=E3=80=82=0D=0Ahttps://kinoini.com=0D=0A=0D=0A=EF=BC=
=9C=E3=81=94=E6=B3=A8=E6=84=8F=E7=82=B9=EF=BC=9E=0D=0A=E2=80=BB=EF=BC=91=EF=
=BC=8E=E6=9C=AC=E3=82=B5=E3=83=BC=E3=83=93=E3=82=B9=E3=81=AF=E3=80=81=E3=81=
=8A=E5=AE=A2=E6=A7=98=E3=81=AE=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B =E3=
=82=AB =E3=83=BC =E3=83=89=E3=81=AE=E3=81=94=E5=88=A9=E7=94=A8=E7=85=A7=E4=
=BC=9A=E3=81=8C=E8=A1=8C=E3=82=8F=E3=82=8C=E3=81=9F=E5=A0=B4=E5=90=88=E3=80=
=81=0D=0A=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B NET=E3=81=AB=E3=81=94=E7=
=99=BB=E9=8C=B2=E3=81=84=E3=81=9F=E3=81=A0=E3=81=84=E3=81=A6=E3=81=84=E3=82=
=8B=E3=83=A1=E3=83=BC=E3=83=AB=E3=82=A2=E3=83=89=E3=83=AC=E3=82=B9=E3=81=B8=
=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=81=99=E3=82=8B=E3=82=B5=E3=83=BC=E3=
=83=93=E3=82=B9=E3=81=A7=E3=81=99=E3=80=82=0D=0A=E2=80=BB=EF=BC=92=EF=BC=8E=
=E3=81=94=E5=A5=91=E7=B4=84=E3=82=AD=E3=83=A3=E3=83=B3=E3=82=BB=E3=83=AB=E3=
=81=A8=E3=81=AA=E3=81=A3=E3=81=9F=E5=A0=B4=E5=90=88=E3=81=AE=E3=81=8A=E5=8F=
=96=E6=B6=88=E3=81=97=E6=83=85=E5=A0=B1=E3=81=AF=E9=85=8D=E4=BF=A1=E3=81=95=
=E3=82=8C=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=0D=0A=E2=80=BB=EF=BC=93=EF=BC=
=8E=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B Visa=E3=83=97=E3=83=AA=E3=83=9A=
=E3=82=A4=E3=83=89=E3=82=AB=E3=83=BC=E3=83=89=E5=8F=8A=E3=81=B3=E4=B8=89=E4=
=BA=95=E4=BD=8F=E5=8F=8B=E3=83=90=E3=83=BC=E3=83=81=E3=83=A3=E3=83=AB=E3=82=
=AB =E3=83=BC =E3=83=89=E3=81=AE=E3=81=94=E5=88=A9=E7=94=A8=E5=88=86=E3=82=
=82=E5=90=AB=E3=81=BF=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=0D=0A=E2=96=A0=E7=99=BA =E8=A1=8C =E8=80=85=E2=
=96=A0=0D=0A=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B =E3=82=AB =E3=83=BC =E3=
=83=89=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE=0D=0A=E3=80=92135-0061=0D=0A=E6=
=9D=B1=E4=BA=AC=E9=83=BD=E6=B1=9F=E6=9D=B1=E5=8C=BA=E8=B1=8A=E6=B4=B22=E4=
=B8=81=E7=9B=AE2=E7=95=AA31


