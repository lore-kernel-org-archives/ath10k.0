Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <144b87a3-bbe4-a194-ed83-e54840d7c7c2@amd.com>
References: <1502849538-14284-1-git-send-email-chrism@mellanox.com>
 <144b87a3-bbe4-a194-ed83-e54840d7c7c2@amd.com>
Message-ID: <150287519355.15499.3124883464555211520@mail.alporthouse.com>
Subject: Re: [patch net-next 0/3] net/sched: Improve getting objects by indexes
Date: Wed, 16 Aug 2017 10:19:53 +0100
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
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Chris Mi <chrism@mellanox.com>, netdev@vger.kernel.org
Cc: lucho@ionkov.net, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com, wsa@the-dreams.de, markb@mellanox.com, tom.leiming@gmail.com, stefanr@s5r6.in-berlin.de, zhi.a.wang@intel.com, nsekhar@ti.com, dri-devel@lists.freedesktop.org, bfields@fieldses.org, linux-sctp@vger.kernel.org, paulus@samba.org, jinpu.wang@profitbricks.com, pshelar@ovn.org, sumit.semwal@linaro.org, AlexBin.Xie@amd.com, david1.zhou@amd.com, linux-samsung-soc@vger.kernel.org, maximlevitsky@gmail.com, sudarsana.kalluru@qlogic.com, marek.vasut@gmail.com, linux-atm-general@lists.sourceforge.net, dtwlin@gmail.com, michel.daenzer@amd.com, dledford@redhat.com, tpmdd-devel@lists.sourceforge.net, stern@rowland.harvard.edu, longman@redhat.com, niranjana.vishwanathapura@intel.com, philipp.reisner@linbit.com, shli@kernel.org, linux@roeck-us.net, ohad@wizery.com, pmladek@suse.com, dick.kennedy@broadcom.com, linux-pm@vger.kernel.org, ericvh@gmail.com, geliangtang@gmail.com, sparmaintainer@unisys.com, giometti@enneenne.com, acme@kernel.org, inki.dae@samsung.com, alex.williamson@redhat.com, rppt@linux.vnet.ibm.com, teigland@redhat.com, viro@zeniv.linux.org.uk, ishkamiel@gmail.com, weiyj.lk@gmail.com, marcos.souza.org@gmail.com, mike.marciniszyn@intel.com, elder@kernel.org, nbd-general@lists.sourceforge.net, nhorman@tuxdriver.com, nicolai.haehnle@amd.com, david.binder@unisys.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, anil.gurumurthy@qlogic.com, linux-kernel@vger.kernel.org, varun@chelsio.com, majd@mellanox.com, devesh.sharma@broadcom.com, sameer.wadgaonkar@unisys.com, bhaktipriya96@gmail.com, alexander.deucher@amd.com, shaun.tancheff@seagate.com, akpm@linux-foundation.org, matan@mellanox.com, jlbec@evilplan.org, kraxel@redhat.com, Jason@zx2c4.com, timothy.sell@unisys.com, airlied@linux.ie, linux-wireless@vger.kernel.org, pantelis.antoniou@konsulko.com, sudeep.dutt@intel.com, neilb@suse.com, edumazet@google.com, target-devel@vger.kernel.org, linux-i2c@vger.kernel.org, daniel.vetter@intel.com, jsarha@ti.com, osandov@fb.com, agk@redhat.com, drbd-dev@lists.linbit.com, boris.brezillon@free-electrons.com, thellstrom@vmware.com, dave@stgolabs.net, paul@paul-moore.com, leon@kernel.org, sainath.grandhi@intel.com, gustavo.padovan@collabora.co.uk, james.smart@broadcom.com, jonathanh@nvidia.com, selvin.xavier@broadcom.com, kgene@kernel.org, linux-graphics-maintainer@vmware.com, andresx7@gmail.com, 3chas3@gmail.com, airlied@redhat.com, sean.hefty@intel.com, virtualization@lists.linux-foundation.org, hal.rosenstock@gmail.com, tj@kernel.org, mszeredi@redhat.com, hannes@stressinduktion.org, felipe.balbi@linux.intel.com, pali.rohar@gmail.com, tpmdd@selhorst.net, linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com, greybus-dev@lists.linaro.org, nishants@marvell.com, swise@chelsio.com, yuval.shaia@oracle.com, xiyou.wangcong@gmail.com, evan.quan@amd.com, lars.ellenberg@linbit.com, linux-arm-kernel@lists.infradead.org, dwindsor@gmail.com, linux-raid@vger.kernel.org, syeh@vmware.com, bryan.thompson@unisys.com, Felix.Kuehling@amd.com, oneukum@suse.com, fw@strlen.de, anna.schumaker@netapp.com, minchan@kernel.org, kyungmin.park@samsung.com, monis@mellanox.com, ebiederm@xmission.com, sre@kernel.org, don.hiatt@intel.com, leo.liu@amd.com, jens.wiklander@linaro.org, hans.westgaard.ry@oracle.com, alexander.shishkin@linux.intel.com, dennis.dalessandro@intel.com, jasowang@redhat.com, joonas.lahtinen@linux.intel.com, jiangshanlai@gmail.com, ast@kernel.org, fbarrat@linux.vnet.ibm.com, mhocko@kernel.org, alexandre.bounine@idt.com, linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, jlayton@poochiereds.net, frowand.list@gmail.com, elena.reshetova@intel.com, f.fainelli@gmail.com, jejb@linux.vnet.ibm.com, daniel@iogearbox.net, linux-rdma@vger.kernel.org, p.shailesh@samsung.com, ath10k@lists.infradead.org, jgunthorpe@obsidianresearch.com, ccaulfie@redhat.com, tomi.valkeinen@ti.com, Monk.Liu@amd.com, dgilbert@interlog.com, ira.weiny@intel.com, david.kershner@unisys.com, adobriyan@gmail.com, jon.maloy@ericsson.com, keescook@chromium.org, arnd@arndb.de, intel-gfx@lists.freedesktop.org, jhs@mojatatu.com, zhenyuw@linux.intel.com, v9fs-developer@lists.sourceforge.net, rmk+kernel@armlinux.org.uk, seanpaul@chromium.org, nab@linux-iscsi.org, Jerry.Zhang@amd.com, eparis@parisplace.org, nicolas.dichtel@6wind.com, Kai.Makisara@kolumbus.fi, mporter@kernel.crashing.org, rogerq@ti.com, linux-nfs@vger.kernel.org, martin.petersen@oracle.com, linux-ppp@vger.kernel.org, dm-devel@redhat.com, sw0312.kim@samsung.com, fujita.tomonori@lab.ntt.co.jp, iommu@lists.linux-foundation.org, roman.kapl@sysgo.com, ngupta@vflare.org, andrew.donnellan@au1.ibm.com, cyrille.pitchen@wedev4u.fr, ying.xue@windriver.com, colin.king@canonical.com, computersforpeace@gmail.com, logang@deltatee.com, davem@davemloft.net, ocfs2-devel@oss.oracle.com, rlove@rlove.org, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, trond.myklebust@primarydata.com, linux-remoteproc@vger.kernel.org, amitkarwar@gmail.com, bjorn.andersson@linaro.org, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, jiri@resnulli.us, peterhuewe@gmx.de, linux1394-devel@lists.sourceforge.net, lee.jones@linaro.org, john@johnmccutchan.com, devel@driverdev.osuosl.org, stephen@networkplumber.org, mario.kleiner.de@gmail.com, manfred@colorfullife.com, oakad@yahoo.com, linux-scsi@vger.kernel.org, mawilcox@microsoft.com, mfasheh@versity.com, richard@nod.at, joro@8bytes.org, jiangyilism@gmail.com, elfring@users.sourceforge.net, cluster-devel@redhat.com, javier@osg.samsung.com, jarkko.sakkinen@linux.intel.com, mingo@redhat.com, vdavydov.dev@gmail.com, kvalo@qca.qualcomm.com, tipc-discussion@lists.sourceforge.net, ogerlitz@mellanox.com, devicetree@vger.kernel.org, lizefan@huawei.com, huxm@marvell.com, mchehab@kernel.org, johan@kernel.org, aditr@vmware.com, linux-block@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, hare@suse.de, rminnich@sandia.gov, linux-tegra@vger.kernel.org, dsa@cumulusnetworks.com, intel-gvt-dev@lists.freedesktop.org, jy0922.shim@samsung.com, axboe@kernel.dk, gbhat@marvell.com, tomas.winkler@intel.com, dedekind1@gmail.com, jbacik@fb.com, jarno@ovn.org, vyasevich@gmail.com, krzk@kernel.org, sboyd@codeaurora.org, jiri@mellanox.com, afd@ti.com, ashutosh.dixit@intel.com, yishaih@mellanox.com, rjw@rjwysocki.net, hannes@cmpxchg.org, Bart.VanAssche@sandisk.com, johannes@sipsolutions.net, dwmw2@infradead.org, dasaratharaman.chandramouli@intel.com

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE3LTA4LTE2IDA4OjQ5OjA3KQo+IEFtIDE2LjA4
LjIwMTcgdW0gMDQ6MTIgc2NocmllYiBDaHJpcyBNaToKPiA+IFVzaW5nIGN1cnJlbnQgVEMgY29k
ZSwgaXQgaXMgdmVyeSBzbG93IHRvIGluc2VydCBhIGxvdCBvZiBydWxlcy4KPiA+Cj4gPiBJbiBv
cmRlciB0byBpbXByb3ZlIHRoZSBydWxlcyB1cGRhdGUgcmF0ZSBpbiBUQywKPiA+IHdlIGludHJv
ZHVjZWQgdGhlIGZvbGxvd2luZyB0d28gY2hhbmdlczoKPiA+ICAgICAgICAgIDEpIGNoYW5nZWQg
Y2xzX2Zsb3dlciB0byB1c2UgSURSIHRvIG1hbmFnZSB0aGUgZmlsdGVycy4KPiA+ICAgICAgICAg
IDIpIGNoYW5nZWQgYWxsIGFjdF94eHggbW9kdWxlcyB0byB1c2UgSURSIGluc3RlYWQgb2YKPiA+
ICAgICAgICAgICAgIGEgc21hbGwgaGFzaCB0YWJsZQo+ID4KPiA+IEJ1dCBJRFIgaGFzIGEgbGlt
aXRhdGlvbiB0aGF0IGl0IHVzZXMgaW50LiBUQyBoYW5kbGUgdXNlcyB1MzIuCj4gPiBUbyBtYWtl
IHN1cmUgdGhlcmUgaXMgbm8gcmVncmVzc2lvbiwgd2UgYWxzbyBjaGFuZ2VkIElEUiB0byB1c2UK
PiA+IHVuc2lnbmVkIGxvbmcuIEFsbCBjbGllbnRzIG9mIElEUiBhcmUgY2hhbmdlZCB0byB1c2Ug
bmV3IElEUiBBUEkuCj4gCj4gV09XLCB3YWl0IGEgc2Vjb25kLiBUaGUgaWRyIGNoYW5nZSBpcyB0
b3VjaGluZyBhIGxvdCBvZiBkcml2ZXJzIGFuZCB0byAKPiBiZSBob25lc3QgZG9lc24ndCBsb29r
cyBjb3JyZWN0IGF0IGFsbC4KPiAKPiBKdXN0IGxvb2sgYXQgdGhlIGZpcnN0IGNodW5rIG9mIHlv
dXIgbW9kaWZpY2F0aW9uOgo+ID4gQEAgLTk5OCw4ICs5OTksOSBAQCBpbnQgYnNnX3JlZ2lzdGVy
X3F1ZXVlKHN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4g
PiAgIAo+ID4gICAgICAgbXV0ZXhfbG9jaygmYnNnX211dGV4KTsKPiA+ICAgCj4gPiAtICAgICBy
ZXQgPSBpZHJfYWxsb2MoJmJzZ19taW5vcl9pZHIsIGJjZCwgMCwgQlNHX01BWF9ERVZTLCBHRlBf
S0VSTkVMKTsKPiA+IC0gICAgIGlmIChyZXQgPCAwKSB7Cj4gPiArICAgICByZXQgPSBpZHJfYWxs
b2MoJmJzZ19taW5vcl9pZHIsIGJjZCwgJmlkcl9pbmRleCwgMCwgQlNHX01BWF9ERVZTLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+
ID4gICAgICAgICAgICAgICBpZiAocmV0ID09IC1FTk9TUEMpIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBwcmludGsoS0VSTl9FUlIgImJzZzogdG9vIG1hbnkgYnNnIGRldmljZXNcbiIpOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gVGhlIGNvbmRpdGlvbiAi
aWYgKHJldCkiIHdpbGwgbm93IGFsd2F5cyBiZSB0cnVlIGFmdGVyIHRoZSBmaXJzdCAKPiBhbGxv
Y2F0aW9uIGFuZCBzbyB3ZSBhbHdheXMgcnVuIGludG8gdGhlIGVycm9yIGhhbmRsaW5nIGFmdGVy
IHRoYXQuCgpyZXQgaXMgbm93IHB1cmVseSB0aGUgZXJyb3IgY29kZSwgc28gaXQgZG9lc24ndCBs
b29rIHRoYXQgc3VzcGljaW91cy4KCj4gSSd2ZSBuZXZlciByZWFkIHRoZSBic2cgY29kZSBiZWZv
cmUsIGJ1dCB0aGF0J3MgY2VydGFpbmx5IG5vdCBjb3JyZWN0LiAKPiBBbmQgdGhhdCBpbmNvcnJl
Y3QgcGF0dGVybiByZXBlYXRzIG92ZXIgYW5kIG92ZXIgYWdhaW4gaW4gdGhpcyBjb2RlLgo+IAo+
IEFwYXJ0IGZyb20gdGhhdCB3aHkgdGhlIGhlY2sgZG8geW91IHdhbnQgdG8gYWxsb2NhdGUgbW9y
ZSB0aGFuIDE8PDMxIAo+IGhhbmRsZXM/CgpBbmQgbW9yZSB0byB0aGUgcG9pbnQsIGFyYml0cmFy
aWx5IGNoYW5naW5nIHRoZSBtYXhpbXVtIHRvIFVMT05HX01BWAp3aGVyZSB0aGUgQUJJIG9ubHkg
c3VwcG9ydHMgVTMyX01BWCBpcyBkYW5nZXJvdXMuIFVubGVzcyB5b3UgZG8gdGhlCmFuYWx5c2lz
IG90aGVyd2lzZSwgeW91IGhhdmUgdG8gcmVwbGFjZSBhbGwgdGhlIGVuZD0wIHdpdGggZW5kPUlO
VF9NQVgKdG8gbWFpbnRhaW4gZXhpc3RpbmcgYmVoYXZpb3VyLgotQ2hyaXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
