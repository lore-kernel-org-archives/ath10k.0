Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTCCm-0000qU-Q4
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 16:31:32 +0000
Received: by lbiz12 with SMTP id z12so22545134lbi.5
 for <ath10k@lists.infradead.org>; Wed, 04 Mar 2015 08:31:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADnKcVjWiHi1RsYwiE6buMduq19i3A5qt8w93VLz6dRg-qLOLQ@mail.gmail.com>
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
 <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 <1425374299.2450.18.camel@sipsolutions.net>
 <CA+XVXffHENxD3z9dTn_LC9c7Ot0Q4FgyEoHLjdeiDTFWQGuF9w@mail.gmail.com>
 <1425377192.2450.34.camel@sipsolutions.net>
 <CA+XVXfdu2fCLXBP1VkMOX9nnoqCiH+h=pwzGAQ2KkBrf-H9MCQ@mail.gmail.com>
 <1425456998.1810.3.camel@sipsolutions.net>
 <CA+XVXfdnTATvbPSkHmGSyMF5d++OmYySskD7D50YvH-wf4eM=w@mail.gmail.com>
 <CADnKcVjWiHi1RsYwiE6buMduq19i3A5qt8w93VLz6dRg-qLOLQ@mail.gmail.com>
From: Arik Nemtsov <arik@wizery.com>
Date: Wed, 4 Mar 2015 18:30:50 +0200
Message-ID: <CA+XVXfeG0TZ+jdRKhcZHzUjxffFbmzJBPtW2nrQ0+JjKC_+mbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for tdls
 station
Content-Type: multipart/mixed; boundary=089e01184bba60e864051078fa91
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Arik Nemtsov <arikx.nemtsov@intel.com>

--089e01184bba60e864051078fa91
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 4, 2015 at 12:38 PM, Marek Puzyniak
<marek.puzyniak@tieto.com> wrote:
> On 4 March 2015 at 11:04, Arik Nemtsov <arik@wizery.com> wrote:
>> I can do it, but I'll probably only get to it next week.
>
> I will try to prepare patch this week, if not I will wait for Arik's
> proposition.
>
> For ath10k rate control need to be initialised before moving to
> STA_AUTHORIZED, so initialising rate control before STA_ASSOC is
> perfectly fine.

Ok I did get to it today :)
With the attached patch applied, and the patch "mac80211: update TDLS
sta spatial streams before auth" reverted, I'm getting good
performance on iwlwifi.

Arik

--089e01184bba60e864051078fa91
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-mac80211-initialize-rate-control-earlier-for-tdls-st.patch"
Content-Disposition: attachment; 
	filename="0001-mac80211-initialize-rate-control-earlier-for-tdls-st.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i6uxxtbw0

RnJvbSAxMzNhOWIyODBjMjNmYTBkNDllOTNkYWU4NjU1Yjk1MTRhYzcxZmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJlayBQdXp5bmlhayA8bWFyZWsucHV6eW5pYWtAdGlldG8u
Y29tPgpEYXRlOiBXZWQsIDI1IEZlYiAyMDE1IDA4OjU1OjEwICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbWFjODAyMTE6IGluaXRpYWxpemUgcmF0ZSBjb250cm9sIGVhcmxpZXIgZm9yIHRkbHMgc3Rh
dGlvbgoKQ3VycmVudGx5IHdoZW4gVERMUyBzdGF0aW9uIGluIGRyaXZlciBnb2VzIGZyb20gYXNz
b2MKdG8gYXV0aG9yaXplZCBzdGF0ZSBpdCBjYW4gbm90IHVzZSByYXRlIGNvbnRyb2wgcGFyYW1l
dGVycwpiZWNhdXNlIHJhdGUgY29udHJvbCBpcyBub3QgaW5pdGlhbGl6ZWQgeWV0LiBTb21lIGRy
aXZlcnMKcmVxdWlyZSBwYXJhbWV0ZXJzIGFscmVhZHkgaW5pdGlhbGl6ZWQgYnkgcmF0ZSBjb250
cm9sIHdoZW4KZW50ZXJpbmcgYXV0aG9yaXplZCBzdGF0ZS4gSXQgY2FuIGJlIGRvbmUgYnkgaW5p
dGlhbGl6aW5nCnJhdGUgY29udHJvbCBhZnRlciBzdGF0aW9uIHRyYW5zaXRpb24gdG8gYXV0aG9y
aXplZCBzdGF0ZQpidXQgYmVmb3JlIG5vdGlmeWluZyBkcml2ZXIgYWJvdXQgdGhhdC4KClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIFB1enluaWFrIDxtYXJlay5wdXp5bmlha0B0aWV0by5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFyaWsgTmVtdHNvdiA8YXJpa3gubmVtdHNvdkBpbnRlbC5jb20+Ci0tLQogbmV0
L21hYzgwMjExL2NmZy5jIHwgMTMgKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9uZXQvbWFjODAyMTEvY2Zn
LmMgYi9uZXQvbWFjODAyMTEvY2ZnLmMKaW5kZXggYzEzYjFhZi4uNTViODhjNyAxMDA2NDQKLS0t
IGEvbmV0L21hYzgwMjExL2NmZy5jCisrKyBiL25ldC9tYWM4MDIxMS9jZmcuYwpAQCAtOTc3LDYg
Kzk3NywxNCBAQCBzdGF0aWMgaW50IHN0YV9hcHBseV9hdXRoX2ZsYWdzKHN0cnVjdCBpZWVlODAy
MTFfbG9jYWwgKmxvY2FsLAogCWlmIChtYXNrICYgQklUKE5MODAyMTFfU1RBX0ZMQUdfQVNTT0NJ
QVRFRCkgJiYKIAkgICAgc2V0ICYgQklUKE5MODAyMTFfU1RBX0ZMQUdfQVNTT0NJQVRFRCkgJiYK
IAkgICAgIXRlc3Rfc3RhX2ZsYWcoc3RhLCBXTEFOX1NUQV9BU1NPQykpIHsKKwkJLyoKKwkJICog
V2hlbiBwZWVyIGJlY29tZXMgYXV0aG9yaXplZCwgaW5pdCByYXRlIGNvbnRyb2wgYXMKKwkJICog
d2VsbC4gU29tZSBkcml2ZXJzIHJlcXVpcmUgcmF0ZSBjb250cm9sIGluaXRpYWxpemVkCisJCSAq
IGJlZm9yZSBkcnZfc3RhX3N0YXRlKCkgaXMgY2FsbGVkLgorCQkgKi8KKwkJaWYgKHRlc3Rfc3Rh
X2ZsYWcoc3RhLCBXTEFOX1NUQV9URExTX1BFRVIpKQorCQkJcmF0ZV9jb250cm9sX3JhdGVfaW5p
dChzdGEpOworCiAJCXJldCA9IHN0YV9pbmZvX21vdmVfc3RhdGUoc3RhLCBJRUVFODAyMTFfU1RB
X0FTU09DKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CkBAIC0xMzgxLDExICsxMzg5LDYg
QEAgc3RhdGljIGludCBpZWVlODAyMTFfY2hhbmdlX3N0YXRpb24oc3RydWN0IHdpcGh5ICp3aXBo
eSwKIAlpZiAoZXJyKQogCQlnb3RvIG91dF9lcnI7CiAKLQkvKiBXaGVuIHBlZXIgYmVjb21lcyBh
dXRob3JpemVkLCBpbml0IHJhdGUgY29udHJvbCBhcyB3ZWxsICovCi0JaWYgKHRlc3Rfc3RhX2Zs
YWcoc3RhLCBXTEFOX1NUQV9URExTX1BFRVIpICYmCi0JICAgIHRlc3Rfc3RhX2ZsYWcoc3RhLCBX
TEFOX1NUQV9BVVRIT1JJWkVEKSkKLQkJcmF0ZV9jb250cm9sX3JhdGVfaW5pdChzdGEpOwotCiAJ
bXV0ZXhfdW5sb2NrKCZsb2NhbC0+c3RhX210eCk7CiAKIAlpZiAoKHNkYXRhLT52aWYudHlwZSA9
PSBOTDgwMjExX0lGVFlQRV9BUCB8fAotLSAKMi4xLjAKCg==
--089e01184bba60e864051078fa91
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--089e01184bba60e864051078fa91--
