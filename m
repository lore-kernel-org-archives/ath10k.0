Return-Path: <SRS0=X+kP=G7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC13C433DB
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D419264DD6
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D419264DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TdmKDBSLVVl2eUh0wCZME1oxoIfzJbL/mY1tJEvGZ3Y=; b=fKQWpYCMcTWvSp4QnPa5e1osA
	bv/NhEHAjG/T6VBx9Jmja/5XNHO4D8fjklqL92cWQdYqU9WrXAK5nRTufK0Dp4hRm4z/L+PrFyQwz
	6BAOQdJ3exMgjFn84DguKu3Ai5QhOwAdo3u4jPgLAUREQIFUnPYoawR09nGVOexbsX3ogl7stwCDM
	1JXfU5MhVzlm5+ZhQTuJT6XvZ7xDRG6gtp7pJ8/p06BDR0vz857Moj/gbGJ0UUr01MYhYmUZnU4C9
	2CiV0nqT82hk92Yzg0/8XFGVj4Yvz509ylYU1kBlDntVuThY2siTE8QQw5VJPwxosQSiTHn4e63tl
	vA/fXQNWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51b8-0007Pe-OD; Thu, 28 Jan 2021 07:20:10 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51b3-0007JD-Tt
 for ath10k@lists.infradead.org; Thu, 28 Jan 2021 07:20:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611818409; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=JuLPSAdeilKNwqBLkl73niz+lwfFEnxP7Hjg4m3No88=;
 b=GjOaWxmjdwjXCaqMrqrqnqYZxAyO12e1NZEU45DPVSWPS8rRR9f+tm+SrkAIr/eWm6Rs0vkz
 a9/7OhwIX7CXu5naLW4aQWsrQfWqqyARwQcMJjok5l2e53PCwHLgKjasi+GLSwvlZQEMwjpa
 Fy3TFZhIKUnyuaAP+TYheAFgQAc=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6012659dbdcf468287324fb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 07:19:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4EBE5C433CA; Thu, 28 Jan 2021 07:19:57 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CC21C433CA;
 Thu, 28 Jan 2021 07:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5CC21C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix wmi mgmt tx queue full due to race
 condition
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1608618887-8857-1-git-send-email-miaoqing@codeaurora.org>
References: <1608618887-8857-1-git-send-email-miaoqing@codeaurora.org>
To: Miaoqing Pan <miaoqing@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210128071957.4EBE5C433CA@smtp.codeaurora.org>
Date: Thu, 28 Jan 2021 07:19:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_022009_461081_D3D93D39 
X-CRM114-Status: GOOD (  15.28  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

TWlhb3FpbmcgUGFuIDxtaWFvcWluZ0Bjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cgo+IEZhaWxlZCB0
byB0cmFuc21pdCB3bWkgbWFuYWdlbWVudCBmcmFtZXM6Cj4gCj4gWzg0OTc3Ljg0MDg5NF0gYXRo
MTBrX3Nub2MgYTAwMDAwMC53aWZpOiB3bWkgbWdtdCB0eCBxdWV1ZSBpcyBmdWxsCj4gWzg0OTc3
Ljg0MDkxM10gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgcGFj
a2V0LCBkcm9wcGluZzogLTI4Cj4gWzg0OTc3Ljg0MDkyNF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53
aWZpOiBmYWlsZWQgdG8gc3VibWl0IGZyYW1lOiAtMjgKPiBbODQ5NzcuODQwOTMyXSBhdGgxMGtf
c25vYyBhMDAwMDAwLndpZmk6IGZhaWxlZCB0byB0cmFuc21pdCBmcmFtZTogLTI4Cj4gCj4gVGhp
cyBpc3N1ZSBpcyBjYXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBh
bmQKPiBfX3NrYl9xdWV1ZV90YWlsLiBUaGUgcXVldWUgb2Yg4oCYd21pX21nbXRfdHhfcXVldWXi
gJkgaXMgcHJvdGVjdGVkIGJ5IGEKPiBkaWZmZXJlbnQgbG9jazogYXItPmRhdGFfbG9jayB2cyBs
aXN0LT5sb2NrLCB0aGUgcmVzdWx0IGlzIG5vIHByb3RlY3Rpb24uCj4gU28gd2hlbiBhdGgxMGtf
bWdtdF9vdmVyX3dtaV90eF93b3JrKCkgYW5kIGF0aDEwa19tYWNfdHhfd21pX21nbXQoKQo+IHJ1
bm5pbmcgY29uY3VycmVudGx5IG9uIGRpZmZlcmVudCBDUFVzLCB0aGVyZSBhcHBlYXIgdG8gYmUg
YSByYXJlIGNvcm5lcgo+IGNhc2VzIHdoZW4gdGhlIHF1ZXVlIGxlbmd0aCBpcyAxLAo+IAo+ICAg
Q1BVeCAoc2tiX2RldXF1ZSkJCQlDUFV5IChfX3NrYl9xdWV1ZV90YWlsKQo+IAkJCQkJbmV4dD1s
aXN0Cj4gCQkJCQlwcmV2PWxpc3QKPiAgIHN0cnVjdCBza19idWZmICpza2IgPSBza2JfcGVlayhs
aXN0KTsJV1JJVEVfT05DRShuZXdzay0+bmV4dCwgbmV4dCk7Cj4gICBXUklURV9PTkNFKGxpc3Qt
PnFsZW4sIGxpc3QtPnFsZW4gLSAxKTtXUklURV9PTkNFKG5ld3NrLT5wcmV2LCBwcmV2KTsKPiAg
IG5leHQgICAgICAgPSBza2ItPm5leHQ7CQlXUklURV9PTkNFKG5leHQtPnByZXYsIG5ld3NrKTsK
PiAgIHByZXYgICAgICAgPSBza2ItPnByZXY7CQlXUklURV9PTkNFKHByZXYtPm5leHQsIG5ld3Nr
KTsKPiAgIHNrYi0+bmV4dCAgPSBza2ItPnByZXYgPSBOVUxMOwlsaXN0LT5xbGVuKys7Cj4gICBX
UklURV9PTkNFKG5leHQtPnByZXYsIHByZXYpOwo+ICAgV1JJVEVfT05DRShwcmV2LT5uZXh0LCBu
ZXh0KTsKPiAKPiBJZiB0aGUgaW5zdHJ1Y3Rpb24g4oCYbmV4dCA9IHNrYi0+bmV4dOKAmSBpcyBl
eGVjdXRlZCBiZWZvcmUKPiDigJhXUklURV9PTkNFKHByZXYtPm5leHQsIG5ld3NrKeKAmSwgbmV3
c2sgd2lsbCBiZSBsb3N0LCBhcyBDUFV4IGdldCB0aGUKPiBvbGQg4oCYbmV4dOKAmSBwb2ludGVy
LCBidXQgdGhlIGxlbmd0aCBpcyBzdGlsbCBhZGRlZCBieSBvbmUuIFRoZSBmaW5hbAo+IHJlc3Vs
dCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBxdWV1ZSB3aWxsIHJlYWNoIHRoZSBtYXhpbXVtIHZhbHVl
IGJ1dAo+IHRoZSBxdWV1ZSBpcyBlbXB0eS4KPiAKPiBTbyByZW1vdmUgYXItPmRhdGFfbG9jaywg
YW5kIHVzZSAnc2tiX3F1ZXVlX3RhaWwnIGluc3RlYWQgb2YKPiAnX19za2JfcXVldWVfdGFpbCcg
dG8gcHJldmVudCB0aGUgcG90ZW50aWFsIHJhY2UgY29uZGl0aW9uLiBBbHNvIHN3aXRjaAo+IHRv
IHVzZSBza2JfcXVldWVfbGVuX2xvY2tsZXNzLCBpbiBjYXNlIHdlIHF1ZXVlIGEgZmV3IFNLQnMg
c2ltdWx0YW5lb3VzbHkuCj4gCj4gVGVzdGVkLW9uOiBXQ04zOTkwIGh3MS4wIFNOT0MgV0xBTi5I
TC4zLjEuYzItMDAwMzMtUUNBSExTV01UUExaLTEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWFvcWlu
ZyBQYW4gPG1pYW9xaW5nQGNvZGVhdXJvcmEub3JnPgo+IFJldmlld2VkLWJ5OiBCcmlhbiBOb3Jy
aXMgPGJyaWFubm9ycmlzQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxv
IDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4KClBhdGNoIGFwcGxpZWQgdG8gYXRoLW5leHQgYnJhbmNo
IG9mIGF0aC5naXQsIHRoYW5rcy4KCmI1NTM3OWUzNDNhMyBhdGgxMGs6IGZpeCB3bWkgbWdtdCB0
eCBxdWV1ZSBmdWxsIGR1ZSB0byByYWNlIGNvbmRpdGlvbgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8xNjA4NjE4ODg3LTg4NTct
MS1naXQtc2VuZC1lbWFpbC1taWFvcWluZ0Bjb2RlYXVyb3JhLm9yZy8KCmh0dHBzOi8vd2lyZWxl
c3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5n
cGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
