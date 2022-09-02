Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6D4ECAAD3
	for <ath10k@archiver.kernel.org>; Fri,  2 Sep 2022 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lUiYFpj02XiBuQ+VKCCRjon75yUj0eqODLA3xJFoDeQ=; b=MGmsgRWaQURrCV
	WWYWmrEFSOJIDFH8C4XqKRWpB2z9zgZcgDQsjhNjqPv3iHVw3Y2lt+Agl2TcUWUjTVf+hk77vpNpE
	IPY2U4mSpbzK+tYXMNqEHDI3/kovUgJhE4h43+bDxJYOrmOt7G+Lme8W8CgMLUQjDTI93U2XODNnK
	0xvZ0VQ2Oc4j4+j10HUHZgxRrB5DaVbWCauUdOb3OXWdsmUwC/35aRflgIuMDy38PuNEygwKusMjy
	5MrL0/khGn0hh4ZfZkYagyKyUkHZffEUPIAp94NQXJdmtR8+twnfKvRqedK5A8/bCUigV0vn3ts/y
	pv82wj6tFLZv+zewDQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTx1a-00HEbN-TB; Fri, 02 Sep 2022 03:07:18 +0000
Received: from mailgate.neusoft.com ([210.83.25.69] helo=mailgate2.neusoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTx1Y-00HEYm-1c
	for ath10k@lists.infradead.org; Fri, 02 Sep 2022 03:07:17 +0000
Received: from smtp.neusoft.com (unknown [192.168.2.231])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id A0839BD2DD73B139138A
	for <ath10k@lists.infradead.org>; Fri,  2 Sep 2022 11:07:14 +0800 (CST)
Received: from NS200808025824A (10.9.224.76) by MPS-EXMBX01.neusoft.internal
 (192.168.2.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 2 Sep 2022
 11:07:14 +0800
Date: Fri, 2 Sep 2022 11:06:36 +0800
From: "li-shh@neusoft.com" <li-shh@neusoft.com>
To: ath10k <ath10k@lists.infradead.org>
Subject: =?utf-8?B?UUNBNjE3NO+8mnJ4IHJpbmcgYmVjYW1lIGNvcnJ1cHRlZDogLTU=?=
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.95[cn]
MIME-Version: 1.0
Message-ID: <2022090211063161626549@neusoft.com>
X-Originating-IP: [10.9.224.76]
X-ClientProxiedBy: MPS-EXMBX06.neusoft.internal (192.168.2.236) To
 MPS-EXMBX01.neusoft.internal (192.168.2.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_200716_274028_7A03D784 
X-CRM114-Status: UNSURE (   2.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGkgYWxs77yMDQogICAgV2hhdCBjb3VkIEkgZG8gZXhjZXB0IHJlYm9vdCB0aGUgc3lzdGVtPw0K
DQogYXRoMTBrX3BjaSAwMDAwOjA2OjAwLjA6IHJ4IHJpbmcgYmVjYW1lIGNvcnJ1cHRlZDogLTUN
Cg0KDQpsaS1zaGhAbmV1c29mdC5jb20NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KQ29uZmlkZW50aWFsaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBhbmQgYW55IGFjY29tcGFueWluZyBhdHRhY2htZW50KHMpDQpp
cyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgYW5k
IG1heSBiZSBjb25maWRlbnRpYWwgYW5kL29yIHByaXZpbGVnZWQgb2YNCk5ldXNvZnQgQ29ycG9y
YXRpb24sIGl0cyBzdWJzaWRpYXJpZXMgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBJZiBhbnkgcmVh
ZGVyIG9mIHRoaXMgY29tbXVuaWNhdGlvbg0KaXMgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
dW5hdXRob3JpemVkIHVzZSxmb3J3YXJkaW5nLCBwcmludGluZywgc3RvcmluZywgZGlzY2xvc3Vy
ZSBvciBjb3B5aW5nDQppcyBzdHJpY3RseSBwcm9oaWJpdGVkLCBhbmQgbWF5IGJlIHVubGF3ZnVs
LklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgY29tbXVuaWNhdGlvbiBpbiBlcnJvcixwbGVhc2UN
CmltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJldHVybiBlLW1haWwsIGFuZCBkZWxl
dGUgdGhlIG9yaWdpbmFsIG1lc3NhZ2UgYW5kIGFsbCBjb3BpZXMgZnJvbQ0KeW91ciBzeXN0ZW0u
IFRoYW5rIHlvdS4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
