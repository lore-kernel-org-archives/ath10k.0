Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E29C54E5D
	for <ath10k@archiver.kernel.org>; Mon, 18 Mar 2024 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oVYciwbxp9yZz27tJe420FcSGVopAaIKXnmPDsbSoXg=; b=Q7+VBMI1GzZbsdT54CWflgfzgO
	xepAwiYtDutTU4x6fY5HYSGT4N2oYY0wmeZkYSjDQEa17XRJITIC+gyesPN2Ih90zsbZDX+ktX7Es
	npFmVRrY+ZPmT1GgAlaTsB82EwbeIoD4hIYF272ajJjZSi/LsJnmavsX4DkUIa/0SmFlPMhgcf8qh
	FkqV4s6TmCvheSgRPOHggD27D+nFsOVO5b6bNFVNBJznHoxgBDVziCR5gMtTDNiQmiU/A5FkP5Mch
	QB74lnh+gzKBlNOYjx9mb1YEX4HngMxvOPtrm27ShOES2U2toC0wKG6+7TCCx/WpHULEVGbcO80wi
	vVPwaDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8db-00000007nO1-0DM2;
	Mon, 18 Mar 2024 08:46:31 +0000
Received: from mail.venturelabo.com ([217.61.16.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8dW-00000007nNQ-2wNR
	for ath10k@lists.infradead.org;
	Mon, 18 Mar 2024 08:46:29 +0000
Received: by mail.venturelabo.com (Postfix, from userid 1002)
	id 5C83B8247C; Mon, 18 Mar 2024 09:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelabo.com;
	s=mail; t=1710751580;
	bh=oVYciwbxp9yZz27tJe420FcSGVopAaIKXnmPDsbSoXg=;
	h=Date:From:To:Subject:From;
	b=fr9pyTw6d02zG/od8KTJMF6KrifQ8X9OoOHU8ftnVYFWmPzZa2+Zcg8rPUqT3JEB4
	 tzTRqUmBEV341j/QcIoXQFZvU8bdU/VVzQLfhBX1veDoEmqZdQnofbcscn7jcAXOhp
	 qylONz0Wwcox59nHEgOdsa55gn7bb+wkz16nT5Ed41SB4+KP0r45UWDgDfPZehzAG1
	 BplOgbkd6Xtls64wVS9/MXrOMmoWMqecqhXrWFznu4mtMQ+6Od8RODygV7LbYMM1o1
	 xyOmkfq0y6fTFeVohUgz33D/Bf/IawOeqWqpxHIqCWDv4iwTz3OSTeM0FZJQRyNWAC
	 euHvjNk1kQ4ZA==
Received: by mail.venturelabo.com for <ath10k@lists.infradead.org>; Mon, 18 Mar 2024 08:46:18 GMT
Message-ID: <20240318084500-0.1.17.2fes.0.m3dpbaildr@venturelabo.com>
Date: Mon, 18 Mar 2024 08:46:18 GMT
From: "Hugh Felton" <hugh.felton@venturelabo.com>
To: <ath10k@lists.infradead.org>
Subject: Tailored educational solutions.
X-Mailer: mail.venturelabo.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014627_484354_CFA17117 
X-CRM114-Status: UNSURE (   2.09  )
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

We support curriculum creators, scientific equipment providers, and textb=
ook publishers in delivering innovative and effective educational tools.

With over 92 years of experience in creating educational products for stu=
dents and teachers, our presence in international markets allows us to sh=
are our expertise from the perspective of various needs and challenges.

Our solutions enrich the teaching process of STEM subjects, increase stud=
ent engagement, and improve learning outcomes.

We offer a wide range of products, starting from laboratory equipment (bi=
ology, chemistry, physics) for all educational levels, to biological spec=
imens (live and preserved organisms), anatomical models, laboratory chemi=
cals, scientific equipment, and ready-made sets for working with students=
 in lessons.

Our curriculum programs tailored for elementary schools, middle schools, =
and higher education institutions provide support on multiple fronts, all=
owing for utilization in various educational environments, including remo=
te learning.

Could I present how our products can contribute to the development of you=
r company?


Best regards
Hugh Felton

