Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BAFC3601A
	for <ath10k@archiver.kernel.org>; Wed,  2 Apr 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=; b=yqZxDAC/Wh/6k/vyQhM0R03wNb
	83tY1q6zZGLoDjQG/yYZw66gBN+eUBDyUvJuzUUnLhAQRSCfFRVM6uWqi8hT9LNYYioLy6/GXDIUs
	6x4Fut0uwZhBASGUj8DQD0IaKyxh8HHp0oZTDYd7RTgFSopAAE/osqEpWYBdd/f5Jo8+f5rWvhEt3
	3CASLzomp49uMKqBTQYyW7F4+O6hlfiVcDNBLoskEpYfDLpK1fRjT+IP/HWF7/MNWpTTnb8jJugtQ
	2ib/Fv31BkGyB/X9h95E+Mcsw9NcZvxwsnKptahYe1ErgwDDXhOK9gES2PN0Wn8Ti2RZE5Es8S013
	6u7QkzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzscc-00000005OXl-0IzJ;
	Wed, 02 Apr 2025 07:34:50 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsaj-00000005OKk-3MPY
	for ath10k@lists.infradead.org;
	Wed, 02 Apr 2025 07:32:55 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id D21A423F76; Wed,  2 Apr 2025 09:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1743579141;
	bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=;
	h=Date:From:To:Subject:From;
	b=Fg+U2Rz4XUIFR2PPtSrF1Qo6ffSav/bugDZflJO1TzyHab+VDKnBax045qtRTLFWW
	 3dsI35jxVY+xuLe4O9Wc8d4fcqUgv/E/E1VaqSbRpnzBluYdiTGHyCWhdt6jIhDRUc
	 MtlgQLHTp8+bqTdkWyeI3sSKKQ/jXr83ufX8hv7zBv4zGfMQ6uR3K23pctkq9nNG6b
	 rN37SSRVwFS0QSadBq3+tNswpkOq3R6BbhI4oelIawP49OP3n9FV+h69LMijbwp8QV
	 8ZLfASwSUkLVIn0gRz/RQG6eVOQCMZHEmbw16guRbrK35zBRdhev2VuegYREH/wKBv
	 BQ0/2nQYneuyw==
Received: by mail.commetrax.com for <ath10k@lists.infradead.org>; Wed,  2 Apr 2025 07:30:56 GMT
Message-ID: <20250402084500-0.1.8s.t30h.0.vqjpbaah61@commetrax.com>
Date: Wed,  2 Apr 2025 07:30:56 GMT
From: "Vincenc Turek" <vincenc.turek@commetrax.com>
To: <ath10k@lists.infradead.org>
Subject: Plastic components and packaging
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_003253_995625_E614C705 
X-CRM114-Status: UNSURE (   1.80  )
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

Hi,

While browsing your offer, I get the impression that packaging quality ma=
tters to you =E2=80=93 it=E2=80=99s not just about protecting the product=
 but also about building your brand image.

We manufacture HDPE and PP bottles, caps, and buckets that work perfectly=
 in the cosmetics, chemical, and food industries. They are durable, aesth=
etically pleasing, and customizable in terms of color and closures to per=
fectly match your brand.

Let me know if you=E2=80=99d like to explore solutions for your business =
=E2=80=93 I=E2=80=99d be happy to present the right products.


Best regards
Vincenc Turek

