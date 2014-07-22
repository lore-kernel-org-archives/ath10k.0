Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Tue, 22 Jul 2014 19:12:43 +0200
From: Benoit Taine <benoit.taine@lip6.fr>
Subject: Re: [PATCH 0/25] Replace DEFINE_PCI_DEVICE_TABLE macro use
Message-ID: <20140722171242.GA742@lip6.fr>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
 <20140718162213.GC31114@tuxdriver.com>
 <20140718164340.GA24960@kroah.com>
 <1405702472.30262.1.camel@dabdike.int.hansenpartnership.com>
 <20140718181759.GB2193@kroah.com>
 <1405709421.30262.8.camel@dabdike.int.hansenpartnership.com>
 <CAErSpo7svKg0HiL=g8wWAHWUN3vs0UgCvVhvd84DM6nVDmT=FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAErSpo7svKg0HiL=g8wWAHWUN3vs0UgCvVhvd84DM6nVDmT=FQ@mail.gmail.com>
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
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, linux-fbdev@vger.kernel.org, Greg KH <greg@kroah.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, James Bottomley <James.Bottomley@hansenpartnership.com>, ath5k-devel@venema.h4ckr.net, linux-acenic@sunsite.dk, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, users@rt2x00.serialmonkey.com, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, ath10k@lists.infradead.org, linux-hippi@sunsite.dk, industrypack-devel@lists.sourceforge.net, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, MPT-FusionLinux.pdl@avagotech.com, ath9k-devel@venema.h4ckr.net, wil6210@qca.qualcomm.com, linux-pcmcia@lists.infradead.org, "John W. Linville" <linville@tuxdriver.com>, linux-can@vger.kernel.org, platform-driver-x86@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "e1000-devel@lists.sourceforge.net" <e1000-devel@lists.sourceforge.net>, linux-crypto@vger.kernel.org, devel@linuxdriverproject.org

T24gMjEvMDcvMjAxNCAxNzoxNiwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBbK2NjIEppbmdvb10K
PiAKPiBPbiBGcmksIEp1bCAxOCwgMjAxNCBhdCAxMjo1MCBQTSwgSmFtZXMgQm90dG9tbGV5Cj4g
PiBBbnl3YXksIGl0J3MgUENJIGNvZGUgLi4uIGxldCB0aGUgUENJIG1haW50YWluZXIgZGVjaWRl
LiAgSG93ZXZlciwgaWYgaGUKPiA+IGRvZXMgd2FudCB0aGlzIGRvIGl0IGFzIG9uZSBiaWcgYmFu
ZyBwYXRjaCB2aWEgZWl0aGVyIHRoZSBQQ0kgb3IgVHJpdmlhbAo+ID4gdHJlZSAobGF0dGVyIGJl
Y2F1c2UgSmnFmcOtIGhhcyBleHBlcmllbmNlIGRvaW5nIHRoaXMsIGJ1dCB0aGUgZm9ybWVyCj4g
PiBtaWdodCBiZSB1c2VmdWwgc28gdGhlIGRlY2lkZXIgZmVlbHMgdGhlIHBhaW4gLi4uKQo+IAo+
IEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBlaXRoZXIgd2F5LCBzbyBJIGd1ZXNzIEknbSBPSyB3aXRo
IHRoaXMsIGFuZCBpbgo+IHRoZSBzcGlyaXQgb2YgZmVlbGluZyB0aGUgcGFpbiwgSSdtIHdpbGxp
bmcgdG8gaGFuZGxlIGl0LiAgSmluZ29vCj4gcHJvcG9zZWQgc2ltaWxhciBwYXRjaGVzLCBzbyBp
dCBtaWdodCBiZSBuaWNlIHRvIGdpdmUgaGltIHNvbWUgY3JlZGl0Lgo+IAo+IEJlbm9pdCwgaG93
IGFib3V0IGlmIHlvdSB3YWl0IHVudGlsIGFib3V0IGhhbGYtd2F5IHRocm91Z2ggdGhlIG1lcmdl
Cj4gd2luZG93IGFmdGVyIHYzLjE2IHJlbGVhc2VzLCBnZW5lcmF0ZSBhbiB1cC10by1kYXRlIHNp
bmdsZSBwYXRjaCwgYW5kCj4gcG9zdCB0aGF0PyAgVGhlbiB3ZSBjYW4gdHJ5IHRvIGdldCBpdCBp
biBiZWZvcmUgdjMuMTctcmMxIHRvIG1pbmltaXplCj4gbWVyZ2UgaGFzc2xlcy4KClN1cmUsIEkg
d2lsbCBkbyB0aGlzLgoKLS0gCkJlbm/DrnQgVGFpbmUKTWFzdGVyIGN5Y2xlIGludGVybgpSZWdh
bCBUZWFtLiBMSVA2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
