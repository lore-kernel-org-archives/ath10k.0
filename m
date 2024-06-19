Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C13C2BA1A
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YXt7Nh5DbnagVVBQO78PcvCLm2c/mGw1xvbk8JWZDxU=; b=4lUQma6W5TJFkRRhla0oBOm4NN
	UwmorFweQYH0VeOfzo3pSNZswPnUhYQHgdsusJVMLnf/kDZeo50jCjDbWXI8v9keeomjs1y4DBXGS
	il6EmKoaBCC9j/ePyPQgGll/T2pn93QT2KWtOKbG3jo6o7/4vk5pINTl+tiV2rit+qYGGhEkZHZ7C
	m+/phSocgXC/EB1ZVTXGinZ4+blKSIRgMERcATSS8d+JfqaTDHT5lOEqBiwUaGxrS9pDfA0nu7YFr
	+1RcwgGBsNLw9FLrsNWUnSqBlIEuWa8wf8gxkwOp99F0qEQM5dcXZm0rxynP7vmGlZ952AkzoiOZI
	itLuc/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK4Ld-00000002yVC-3uFO;
	Wed, 19 Jun 2024 23:04:13 +0000
Received: from [195.123.247.173] (helo=mail0.sanin-bankin.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK4LX-00000002yQQ-4BKK
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 23:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=sanin-bankin.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@sanin-bankin.com;
 bh=YXt7Nh5DbnagVVBQO78PcvCLm2c/mGw1xvbk8JWZDxU=;
 b=IAFnropZTSvFzXhwUIaj/O34BMYj1rNiuFxMMqUx15T5lRPfaYcsd9FP+8SIcTe+fvpLEB0UcpVy
   nGagnQnbsEzJSgT/5rCgRZ7rFUfdNEMGK0CQZqui5LMmFk6qBmv615sYoGapQm9TshVOlWipWX9P
   bo/DzjsXNW1iE3xDUJ4=
From: =?utf-8?B?5p2x5Lqs6Zu75Yqb?= <no-reply@sanin-bankin.com>
To: <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ44GP44KJ44GXVEVQQ08gd2Vi44CR5pyq57SN6Zu75rCX?=
	=?utf-8?B?5paZ6YeR44Gu44GK55+l44KJ44Gb77yI6Ieq5YuV6YWN5L+h44Oh44O8?=
	=?utf-8?B?44Or77yJ?=
Date: Thu, 20 Jun 2024 06:53:45 +0800
Message-ID: <FINDADGIJCFACDPDBDIPHDPLGNMG.no-reply@sanin-bankin.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_160408_548267_FC374CAE 
X-CRM114-Status: UNSURE (  -0.21  )
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

=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=0D=0A=E2=96=A0=E2=96=A1=E2=96=A0 TEPCO=E3=82=88=E3=82=
=8A=E3=81=94=E5=88=A9=E7=94=A8=E6=96=99=E9=87=91=E3=81=AE=E3=81=94=E8=AB=8B=
=E6=B1=82=E3=81=A7=E3=81=99 =E2=96=A0=E2=96=A1=E2=96=A0=0D=0A=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=0D=0A=E2=80=BB=E4=B8=8B=E8=A8=98URL=E3=81=AE=E6=9C=89=E5=8A=B9=E6=
=9C=9F=E9=99=90=E3=81=AF3=E6=97=A5=E4=BB=A5=E5=86=85=E3=81=A8=E3=81=AA=E3=
=82=8A=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E2=80=BB=E6=9C=89=E5=8A=B9=E6=9C=9F=
=E9=99=90=E3=81=8C=E5=88=87=E3=82=8C=E3=81=A6=E6=94=AF=E6=89=95=E6=89=8B=E7=
=B6=9A=E3=81=8D=E3=81=8C=E5=AE=8C=E4=BA=86=E3=81=A7=E3=81=8D=E3=81=AA=E3=81=
=84=E5=A0=B4=E5=90=88=E3=81=AB=E3=81=AF=E3=80=81=E6=81=90=E3=82=8C=E5=85=A5=
=E3=82=8A=E3=81=BE=E3=81=99=E3=81=8C=E3=80=81=E9=9B=BB=E6=B0=97=C2=B7=E3=82=
=AC=E3=82=B9=E4=BD=BF=E7=94=A8=E5=81=9C=E6=AD=A2=E3=80=82=0D=0A=0D=0A=E2=96=
=BC=E6=94=AF=E6=89=95=E3=81=84=E3=81=AE=E8=A9=B3=E7=B4=B0=E3=83=AA=E3=83=B3=
=E3=82=AF=E3=82=A8=E3=83=B3=E3=83=88=0D=0Ahttps://shyueren.com=0D=0A=0D=0A=
=E2=80=BB=E6=9C=AC=E3=83=A1-=E3=83=AB=E3=81=AF=E9=80=81=E4=BF=A1=E5=B0=88=
=E7=94=A8=E3=83=A1-=E3=83=AB=E3=82=A2=E3=83=89=E3=83=AC=E3=82=B9=E3=81=8B=
=E3=82=89=E3=81=8A=E9=80=81=E3=82=8A=E3=81=97=E3=81=A6=E3=81=84=E3=81=BE=E3=
=81=99=E3=80=82=0D=0A=E3=81=94=E8=BF=94=E4=BF=A1=E3=81=84=E3=81=9F=E3=81=A0=
=E3=81=8D=E3=81=BE=E3=81=97=E3=81=A6=E3=82=82=E3=81=8A=E7=AD=94=E3=81=88=E3=
=81=A7=E3=81=8D=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=0D=0A=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0D=0A=E6=9D=B1=E4=BA=AC=E9=9B=BB=E5=8A=9B=E3=82=A8=E3=83=8A=E3=82=B8=E3=83=
=BC=E3=83=91=E3=83=BC=E3=83=88=E3=83=8A=E3=83=BC=E6=A0=AA=E5=BC=8F=E4=BC=9A=
=E7=A4=BE=0D=0ATEPCO Energy Partner,Incorporated=0D=0A=E3=80=92104-0061 =E6=
=9D=B1=E4=BA=AC=E9=83=BD=E4=B8=AD=E5=A4=AE=E5=8C=BA=E9=8A=80=E5=BA=A7=E5=85=
=AB=E4=B8=81=E7=9B=AE=EF=BC=91=EF=BC=93=E7=95=AA=EF=BC=91=E5=8F=B7 =E9=8A=
=80=E5=BA=A7=E4=B8=89=E4=BA=95=E3=83=93=E3=83=AB=E3=83=87=E3=82=A3=E3=83=B3=
=E3=82=B0


