Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC62C61DA4
	for <ath10k@archiver.kernel.org>; Mon, 13 Mar 2023 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CtGsjlSBAX9Wiu4IdJ1A2TfsjuelwYZUXTZ7nW5S8YA=; b=qjy4tr/1N0U50z
	cQNwi+VCwooZNkje7M/0ZB3OYdu4C7GGv/QzKyUut18VLXWAgK88XglcZuE9Mew04EtUmtZxH30s3
	wMxc+aGgvfNPtmtiMCMS72MrGgyHRjqWZ4F0SDTLqFmKw/xPbe1VprwUxGPDvOu42A9fTgBCX6zje
	FYYT3jjCu24m7+RwZ/uWcvBS/uESdNbdOr34Y6v6+gtiKW9IyvGUEc/pFAoQV0qtqybKpHKMZZhOG
	0jsSZHiT7pQaboVq+DuLfAFLrQAnudp3RoAkDkcxTBtbKDp6eT4cu8YbNzZ8i+yt3TcJq/+Ql1Vsw
	+54lITiH6Vh3D9i7O3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbm1S-0078Bt-TD; Mon, 13 Mar 2023 17:31:48 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblys-00775B-Ew
	for ath10k@lists.infradead.org; Mon, 13 Mar 2023 17:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=yQ2DpaTtF/o3hQPEE+fO9PF4Tl9KpVOY4i4byTbW+cc=; b=X
	WNRBz2tkfSI5qAKtQ9LF1ORY/R0IIzWlpVcv/Bwfa37L1vQtvlU9kj61U5GF7leBlTdprfG2GlgQ3
	MeHpWdIYIZ+e6bPQ4dEmuxuop0h3Ptoq94I3XyPRvoqSoaQXsRjFxR7yLQNYK4ldNfzrwM1ZeH2XX
	kRYr+R5jsY6MlXDU=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pblyq-00067Y-07
	for ath10k@lists.infradead.org; Tue, 14 Mar 2023 00:29:04 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: ath10k@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:29:03 +0000
Message-ID: <20230313152049.997BDEF6DD2D8EEF@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_102907_918393_EA3E1F87 
X-CRM114-Status: UNSURE (  -0.82  )
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dear ath10k
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
