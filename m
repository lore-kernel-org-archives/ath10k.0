Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD3DC10F04
	for <ath10k@archiver.kernel.org>; Sat,  9 Dec 2023 02:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZVtgXJkz+SHkqINfMrdE80iUPT3tAA/d4LLHLnFXIto=; b=vEiUg87k9vEyuY
	yM32v13G6jY1uuNpnawhaU9bCvxEele3/ovh5qFw0Z28+5rh5DnNxcz6eByepAK/bZr6q/COkYyn3
	WL/ZI7NPlDqZhVlARMyHBXXxrDAju72ZnPGH78UbBGN7gxYJ2UYMN01DysHRX0vw+49ExoRFzV0Yk
	jkC7oVkZI3+gd5lMejF7nYRnkx4SP0PhczO7ubv4Kg9DLjvj5DGeVSfwW9M/F0MwW2zFPj874uKuZ
	K9w2KY31GZiT6kssFDKbtCQ8NzQn6iD3RsHA0pGfPY7p6WpZtzOnWQvdTnoIv/6H1rVbhc6pmM5Cv
	ju9HIA9RXVrz47h8FufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBn0f-00GxbY-1X;
	Sat, 09 Dec 2023 02:24:05 +0000
Received: from mbox.chem.uni-sofia.bg ([2001:67c:20d0:50::7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBn0c-00GxaL-1E
	for ath10k@lists.infradead.org;
	Sat, 09 Dec 2023 02:24:03 +0000
X-Authost: /var/run/dovecot/lmtp
DKIM-Filter: OpenDKIM Filter v2.11.0 mbox.chem.uni-sofia.bg 3B6CtWr8007074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chem.uni-sofia.bg;
	s=2018101300; t=1701867371;
	bh=ZVtgXJkz+SHkqINfMrdE80iUPT3tAA/d4LLHLnFXIto=;
	h=Reply-To:From:To:Subject:Date:From;
	b=GV+uv1QAoO6cygg/HFKkkSaTiR7DtCoK3BrjKZGR8zeLbjprddpgH2+81fT2NPoTo
	 ZPyyQmXN1glnt04hCQptExFMaT73FLNOahu6uZswIVUVFprJ/ZPPL5kUsrhTQ/WnYH
	 CUy5k44VwQJSFQHD6keup4H1enEfAF7l4kxltOhE6JEcTBaylDiu0tkXCrmXv+DKCJ
	 NaXuqbNi+ORNHs8CBsbv/vcBTd604vHBPraMFy5Ixxka2ABq3eDAtZtWVShfloPSgd
	 FWAcP8bJpfzNhlGM4r9xuXis3s7uw7QsgMXvK2RUh2UNLzuPLTnfeVV/V0qHHekOqT
	 PYtwU7CDpD+cA==
Received: from chem.uni-sofia.bg ([216.24.213.33])
	(authenticated bits=0)
	by mbox.chem.uni-sofia.bg (8.14.7/8.14.7) with ESMTP id 3B6CtWr8007074
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <ath10k@lists.infradead.org>; Wed, 6 Dec 2023 14:56:10 +0200
From: "Kristine Wellenstein" <ohtvd@chem.uni-sofia.bg>
To: ath10k@lists.infradead.org
Subject: [RE]: RE:
Date: 06 Dec 2023 07:56:08 -0500
Message-ID: <20231206075608.455994F1212559A3@chem.uni-sofia.bg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_182402_770775_47EB6140 
X-CRM114-Status: UNSURE (   0.06  )
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
Reply-To: Kristine Wellenstein <brianwallace927@gmail.com>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Gr=C3=BC=C3=9Fe,

Mein Name ist Kristine Wellenstein. Ich schreibe Ihnen, um Ihnen eine spann=
ende Gesch=C3=A4ftsm=C3=B6glichkeit vorzustellen, von der ich glaube, dass =
sie f=C3=BCr uns beide von Vorteil sein k=C3=B6nnte.

Ich arbeite in einem bekannten Pharmaunternehmen in Asien und wir haben k=
=C3=BCrzlich ein neues Produkt/eine neue Dienstleistung entwickelt, die neu=
e M=C3=B6glichkeiten er=C3=B6ffnet.

Ich w=C3=BCrde gerne eine Gesch=C3=A4ftsvereinbarung vorschlagen, um diese =
M=C3=B6glichkeit detaillierter zu besprechen. Ich bin zuversichtlich, dass =
diese Gelegenheit f=C3=BCr uns beide von Vorteil w=C3=A4re, wenn wir gut mi=
teinander auskommen.

Ich freue mich auf die Gelegenheit, mit Ihnen zusammenzuarbeiten.

P.S. Sollten Sie nach unserem Gespr=C3=A4ch kein Interesse an diesem Angebo=
t haben, steht Ihnen ein Widerruf frei.

Ich erwarte eine positive Reaktion.

Gr=C3=BC=C3=9Fe

Kristine Wellenstein

