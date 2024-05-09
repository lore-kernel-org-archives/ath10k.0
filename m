Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A55C10F1A
	for <ath10k@archiver.kernel.org>; Thu,  9 May 2024 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Date:Message-ID:Mime-Version:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ZoNY7Zv4mi6EpKQFct/ImHz8hKOLQRPwjyZbbfaCK4=; b=PAeJDS/TGPAflHN2wEmQGFan1Q
	M9vwBY9Va2M0A49eggkfdHUsaJiKK5YN3LxtTNorpg/pQ7Ax6dPt30iecTeSZTRuZv06CHnBvZ9Rv
	CRUr8zPZ+UMms2FpbGRjrESH4LscnT565zjvoXBdZfzcwhHolNHFfM46fLYYX+iSjkwA0zOw0wnH1
	knFVc92GtkHBzoiTf85jr3EAIyAId2R+6PSvchPEpKpmhACKKqVjs3l9FAeQ/QGyQNe9dqWVKtMpo
	ClmJ65wimxnIu058oAYOaOrd3NmUuXZm8QJZd7//jFqpSDMex0KFXxzUk0PT6vlK2WOdA8xy8+8qw
	vT+xuYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BZH-0000000304c-1VJg;
	Thu, 09 May 2024 21:44:47 +0000
Received: from [104.143.35.200] (helo=mail0.rtjkohfjdqd002.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BZD-0000000303a-1AUJ
	for ath10k@lists.infradead.org;
	Thu, 09 May 2024 21:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=rtjkohfjdqd002.com;
 h=From:To:Subject:Mime-Version:Message-ID:Date:Content-Type:
 Content-Transfer-Encoding; i=no-reply@rtjkohfjdqd002.com;
 bh=5ZoNY7Zv4mi6EpKQFct/ImHz8hKOLQRPwjyZbbfaCK4=;
 b=byntCD0wIbQDMq3w13fh/m3NAAEqeukMlONoX2MFk2ybs0wJdYKK2gHs1DyMqXss/Y/LGzkwqKBK
   Y2c3kFz3AXEdCIMJ6Rxo6kwoGEeKN1Wd/O2CsUOxLLH9s6TCgRc6sD7IBJYsFGToA8UNUwRsFv3b
   6sNVqH58/t0+Cc+KrXg=
From: =?utf-8?Q?=E8=87=AA=E5=8B=95=E3=83=A1=E3=83=BC=E3=83=AB=E9=80=9A=E7=9F=A5?= <no-reply@rtjkohfjdqd002.com>
To: <ath10k@lists.infradead.org>
Subject: =?utf-8?Q?=E3=80=90=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B?=
	=?utf-8?Q?=E3=82=AB=E3=83=BC=E3=83=89=E3=80=91=E3=81=94=E5=88=A9?=
	=?utf-8?Q?=E7=94=A8=E6=98=8E=E7=B4=B0=E3=81=AE=E3=81=8A=E7=9F=A5?=
	=?utf-8?Q?=E3=82=89=E3=81=9B?=
Mime-Version: 1.0
Message-ID: <tencent_8C94B272516716439EDED30B@rtjkohfjdqd002.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
Date: Fri, 10 May 2024 05:34:29 +0800
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_144443_804477_6F178065 
X-CRM114-Status: UNSURE (   2.02  )
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

=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E3=
=81=94=E5=88=A9=E7=94=A8=E3=81=AE=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=B8=0D=0A=
=0D=0A=E3=81=93=E3=81=AE=E3=81=9F=E3=81=B3=E3=81=AF=E4=B8=89=E4=BA=95=E4=BD=
=8F=E5=8F=8B=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E3=81=94=E5=88=A9=E7=94=A8=
=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8D=E3=80=81=E8=AA=A0=E3=81=AB=E3=81=82=E3=
=82=8A=E3=81=8C=E3=81=A8=E3=81=86=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E3=81=
=99=E3=80=82=0D=0A=E4=B8=8B=E8=A8=98=E3=81=AE=E3=81=A8=E3=81=8A=E3=82=8A=E3=
=81=94=E5=88=A9=E7=94=A8=E6=98=8E=E7=B4=B0=E3=82=92=E5=8F=97=E9=A0=98=E3=81=
=84=E3=81=9F=E3=81=97=E3=81=BE=E3=81=97=E3=81=9F=E3=81=AE=E3=81=A7=E3=80=81=
=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=81=84=E3=81=9F=E3=81=97=E3=81=BE=E3=
=81=99=E3=80=82=0D=0A=0D=0A=E3=81=94 =E5=88=A9 =E7=94=A8 =E6=97=A5 =E6=99=
=82 =EF=BC=9A2024/05/09/21:49=0D=0A=E3=81=94 =E5=88=A9 =E7=94=A8 =E5=A0=B4 =
=E6=89=80 =EF=BC=9A=E5=8D=83=E4=BB=A3=E7=94=B0=E4=B8=80=E3=83=84=E6=A9=8B 1=
 =E4=B8=81=E7=9B=AE=E5=BA=97 (=E3=82=BB=E3=83=96=E3=83=B3=E3=82=A4=E3=83=AC=
=E3=83=96=E3=83=B3)=0D=0A=E3=81=94 =E5=88=A9 =E7=94=A8 =E9=87=91 =E9=A1=8D =
=EF=BC=9A9730=E5=86=86=0D=0A=0D=0A=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E4=
=BD=BF=E7=94=A8=E3=81=97=E3=81=9F=E8=A6=9A=E3=81=88=E3=81=8C=E3=81=AA=E3=81=
=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E4=BB=A5=E4=B8=8B =E3=81=AE =E3=83=
=AA =E3=83=B3 =E3=82=AF =E3=82=92=E3=82=AF=E3=83=AA =E3=83=83 =E3=82=AF =E3=
=81=97 =E3=81=A6=E3=82=AB =E3=83=BC =E3=83=89=E4=BD=BF=E7=94=A8=E3=81=AE=E8=
=A9=B3=E7=B4=B0=E3=82=92=E7=A2=BA=E8=AA=8D=E3=81=97=E3=81=A6=E3=81=8F=E3=81=
=A0=E3=81=95=E3=81=84=E3=80=82=0D=0Ahttps://yasarcanturk.com=0D=0A=0D=0A=EF=
=BC=9C=E3=81=94=E6=B3=A8 =E6=84=8F=EF=BC=9E=0D=0A=E6=9C=AC=E3=82=B5=E3=83=
=BC=E3=83=93=E3=82=B9=E3=81=AF=E3=80=81=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=AE=
=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B=E3=82=AB=E3=83=BC=E3=83=89=E3=81=AE=E3=
=81=94=E5=88=A9=E7=94=A8=E7=85=A7=E4=BC=9A=E3=81=8C=E8=A1=8C=E3=82=8F=E3=82=
=8C=E3=81=9F=E5=A0=B4=E5=90=88=E3=80=81=0D=0A=E4=B8=89 =E4=BA=95 =E4=BD=8F =
=E5=8F=8B NET=E3=81=AB=E3=81=94=E7=99=BB=E9=8C=B2=E3=81=84=E3=81=9F=E3=81=
=A0=E3=81=84=E3=81=A6=E3=81=84=E3=82=8B=E3=83=A1=E3=83=BC=E3=83=AB=E3=82=A2=
=E3=83=89=E3=83=AC=E3=82=B9=E3=81=B8=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=
=81=99=E3=82=8B=E3=82=B5=E3=83=BC=E3=83=93=E3=82=B9=E3=81=A7=E3=81=99=E3=80=
=82=0D=0A=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=0D=0A=E2=96=A0.=E7=99=BA =E8=A1=8C =
=E8=80=85.=E2=96=A0=0D=0A   =E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B =E3=82=
=AB =E3=83=BC =E3=83=89 =E6=A0=AA =E5=BC=8F =E4=BC=9A =E7=A4=BE=0D=0A   Cop=
yright @ Sumitomo Mitsui Banking Corporation.


