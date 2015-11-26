Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1yrq-0005Ju-8D
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 15:53:54 +0000
Subject: Re: [PATCH] ath10: Fix build with CONFIG_THERMAL=m
References: <201511260039.iQbaOe1h%fengguang.wu@intel.com>
 <1448552198-26911-1-git-send-email-mmarek@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56572AFB.20309@suse.cz>
Date: Thu, 26 Nov 2015 16:53:31 +0100
MIME-Version: 1.0
In-Reply-To: <1448552198-26911-1-git-send-email-mmarek@suse.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: fengguang.wu@intel.com, kbuild-all@01.org, ath10k@lists.infradead.org, linux-kbuild@vger.kernel.org

T24gMjAxNS0xMS0yNiAxNjozNiwgTWljaGFsIE1hcmVrIHdyb3RlOgo+IEFmdGVyIGNvbW1pdCBj
ZjRmMjE5MzhlMTMgKCJrYnVpbGQ6IEFsbG93IHRvIHNwZWNpZnkgY29tcG9zaXRlIG1vZHVsZXMK
PiB3aXRoIG1vZG5hbWUtbSIpLCB0aGVybWFsLmMgZ2V0cyBpbmNsdWRlZCBpbiB0aGUgZHJpdmVy
IGFuZCB0aGUgYnVpbGQKPiBmYWlscyB3aXRoCj4gCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDEway90aGVybWFsLmM6MTE5OjY6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYYXRoMTBr
X3RoZXJtYWxfZXZlbnRfdGVtcGVyYXR1cmXigJkKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL3RoZXJtYWwuaDo1NDoyMDogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiDigJhh
dGgxMGtfdGhlcm1hbF9ldmVudF90ZW1wZXJhdHVyZeKAmSB3YXMgaGVyZQo+IGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5jOjEzNjo2OiBlcnJvcjogcmVkZWZpbml0aW9u
IG9mIOKAmGF0aDEwa190aGVybWFsX3NldF90aHJvdHRsaW5n4oCZCj4gZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway90aGVybWFsLmg6NTk6MjA6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRp
b24gb2Yg4oCYYXRoMTBrX3RoZXJtYWxfc2V0X3Rocm90dGxpbmfigJkgd2FzIGhlcmUKPiBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3RoZXJtYWwuYzoxNjI6NTogZXJyb3I6IHJlZGVm
aW5pdGlvbiBvZiDigJhhdGgxMGtfdGhlcm1hbF9yZWdpc3RlcuKAmQo+IGRyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5oOjQ1OjE5OiBub3RlOiBwcmV2aW91cyBkZWZpbml0
aW9uIG9mIOKAmGF0aDEwa190aGVybWFsX3JlZ2lzdGVy4oCZIHdhcyBoZXJlCj4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway90aGVybWFsLmM6MjE2OjY6IGVycm9yOiByZWRlZmluaXRp
b24gb2Yg4oCYYXRoMTBrX3RoZXJtYWxfdW5yZWdpc3RlcuKAmQo+IGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvdGhlcm1hbC5oOjUwOjIwOiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9u
IG9mIOKAmGF0aDEwa190aGVybWFsX3VucmVnaXN0ZXLigJkgd2FzIGhlcmUKPiAKPiBDaGFuZ2Ug
dGhlICNpZmRlZiB0byByZWZsZWN0IHRoZSBuZXcga2J1aWxkIGJlaGF2aW9yLgoKRm9yZ290IHRv
IG1lbnRpb246IFRoZSBhYm92ZSBjb21taXQgb25seSBleGlzdHMgaW4gdGhlIGtidWlsZCB0cmVl
LCBzbyBJCndpbGwgYXBwbHkgdGhpcyB0aGVyZSBhcyB3ZWxsLCB1bmxlc3MgYW55Ym9keSBvYmpl
Y3RzLiBBcHBseWluZyB0aGUKcGF0Y2ggdG8gdGhlIGF0aCB0cmVlIHdvdWxkIGJyZWFrIHRoZSBv
dGhlciB3YXkgYXJvdW5kLgoKTWljaGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
