Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129] helo=mellanox.co.il)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dhnrz-00077Y-MK
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 02:15:52 +0000
From: Chris Mi <chrism@mellanox.com>
Subject: [patch net-next 2/3] net/sched: Change cls_flower to use IDR
Date: Tue, 15 Aug 2017 22:12:17 -0400
Message-Id: <1502849538-14284-3-git-send-email-chrism@mellanox.com>
In-Reply-To: <1502849538-14284-1-git-send-email-chrism@mellanox.com>
References: <1502849538-14284-1-git-send-email-chrism@mellanox.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: netdev@vger.kernel.org
Cc: lucho@ionkov.net, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com, wsa@the-dreams.de, markb@mellanox.com, tom.leiming@gmail.com, stefanr@s5r6.in-berlin.de, zhi.a.wang@intel.com, nsekhar@ti.com, dri-devel@lists.freedesktop.org, bfields@fieldses.org, linux-sctp@vger.kernel.org, paulus@samba.org, jinpu.wang@profitbricks.com, pshelar@ovn.org, sumit.semwal@linaro.org, AlexBin.Xie@amd.com, david1.zhou@amd.com, linux-samsung-soc@vger.kernel.org, maximlevitsky@gmail.com, sudarsana.kalluru@qlogic.com, marek.vasut@gmail.com, linux-atm-general@lists.sourceforge.net, dtwlin@gmail.com, michel.daenzer@amd.com, dledford@redhat.com, tpmdd-devel@lists.sourceforge.net, stern@rowland.harvard.edu, longman@redhat.com, niranjana.vishwanathapura@intel.com, philipp.reisner@linbit.com, shli@kernel.org, linux@roeck-us.net, ohad@wizery.com, pmladek@suse.com, dick.kennedy@broadcom.com, linux-pm@vger.kernel.org, ericvh@gmail.com, geliangtang@gmail.com, sparmaintainer@unisys.com, giometti@enneenne.com, acme@kernel.org, inki.dae@samsung.com, alex.williamson@redhat.com, rppt@linux.vnet.ibm.com, teigland@redhat.com, viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, weiyj.lk@gmail.com, chrism@mellanox.com, marcos.souza.org@gmail.com, mike.marciniszyn@intel.com, elder@kernel.org, nbd-general@lists.sourceforge.net, nhorman@tuxdriver.com, nicolai.haehnle@amd.com, david.binder@unisys.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, anil.gurumurthy@qlogic.com, linux-kernel@vger.kernel.org, varun@chelsio.com, majd@mellanox.com, devesh.sharma@broadcom.com, sameer.wadgaonkar@unisys.com, bhaktipriya96@gmail.com, alexander.deucher@amd.com, shaun.tancheff@seagate.com, akpm@linux-foundation.org, matan@mellanox.com, jlbec@evilplan.org, kraxel@redhat.com, Jason@zx2c4.com, timothy.sell@unisys.com, airlied@linux.ie, linux-wireless@vger.kernel.org, pantelis.antoniou@konsulko.com, sudeep.dutt@intel.com, neilb@suse.com, edumazet@google.com, target-devel@vger.kernel.org, linux-i2c@vger.kernel.org, daniel.vetter@intel.com, jsarha@ti.com, osandov@fb.com, agk@redhat.com, drbd-dev@lists.linbit.com, boris.brezillon@free-electrons.com, thellstrom@vmware.com, dave@stgolabs.net, paul@paul-moore.com, leon@kernel.org, sainath.grandhi@intel.com, gustavo.padovan@collabora.co.uk, james.smart@broadcom.com, jonathanh@nvidia.com, selvin.xavier@broadcom.com, kgene@kernel.org, linux-graphics-maintainer@vmware.com, andresx7@gmail.com, 3chas3@gmail.com, airlied@redhat.com, sean.hefty@intel.com, virtualization@lists.linux-foundation.org, hal.rosenstock@gmail.com, tj@kernel.org, mszeredi@redhat.com, hannes@stressinduktion.org, felipe.balbi@linux.intel.com, pali.rohar@gmail.com, tpmdd@selhorst.net, linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com, greybus-dev@lists.linaro.org, nishants@marvell.com, swise@chelsio.com, yuval.shaia@oracle.com, xiyou.wangcong@gmail.com, evan.quan@amd.com, lars.ellenberg@linbit.com, linux-arm-kernel@lists.infradead.org, dwindsor@gmail.com, linux-raid@vger.kernel.org, syeh@vmware.com, bryan.thompson@unisys.com, ying.xue@windriver.com, Felix.Kuehling@amd.com, oneukum@suse.com, fw@strlen.de, davem@davemloft.net, minchan@kernel.org, kyungmin.park@samsung.com, monis@mellanox.com, ebiederm@xmission.com, sre@kernel.org, don.hiatt@intel.com, leo.liu@amd.com, jens.wiklander@linaro.org, hans.westgaard.ry@oracle.com, alexander.shishkin@linux.intel.com, dennis.dalessandro@intel.com, jasowang@redhat.com, joonas.lahtinen@linux.intel.com, jiangshanlai@gmail.com, ast@kernel.org, fbarrat@linux.vnet.ibm.com, mhocko@kernel.org, alexandre.bounine@idt.com, linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, jlayton@poochiereds.net, frowand.list@gmail.com, elena.reshetova@intel.com, f.fainelli@gmail.com, jejb@linux.vnet.ibm.com, daniel@iogearbox.net, linux-rdma@vger.kernel.org, p.shailesh@samsung.com, ath10k@lists.infradead.org, jgunthorpe@obsidianresearch.com, ccaulfie@redhat.com, tomi.valkeinen@ti.com, Monk.Liu@amd.com, dgilbert@interlog.com, ira.weiny@intel.com, david.kershner@unisys.com, adobriyan@gmail.com, jon.maloy@ericsson.com, keescook@chromium.org, arnd@arndb.de, intel-gfx@lists.freedesktop.org, jhs@mojatatu.com, zhenyuw@linux.intel.com, v9fs-developer@lists.sourceforge.net, rmk+kernel@armlinux.org.uk, seanpaul@chromium.org, nab@linux-iscsi.org, Jerry.Zhang@amd.com, eparis@parisplace.org, nicolas.dichtel@6wind.com, chris@chris-wilson.co.uk, mporter@kernel.crashing.org, rogerq@ti.com, linux-nfs@vger.kernel.org, martin.petersen@oracle.com, linux-ppp@vger.kernel.org, dm-devel@redhat.com, sw0312.kim@samsung.com, fujita.tomonori@lab.ntt.co.jp, iommu@lists.linux-foundation.org, roman.kapl@sysgo.com, ngupta@vflare.org, andrew.donnellan@au1.ibm.com, cyrille.pitchen@wedev4u.fr, thierry.reding@gmail.com, colin.king@canonical.com, computersforpeace@gmail.com, logang@deltatee.com, christian.koenig@amd.com, ocfs2-devel@oss.oracle.com, rlove@rlove.org, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, trond.myklebust@primarydata.com, linux-remoteproc@vger.kernel.org, amitkarwar@gmail.com, bjorn.andersson@linaro.org, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, jiri@resnulli.us, peterhuewe@gmx.de, linux1394-devel@lists.sourceforge.net, lee.jones@linaro.org, john@johnmccutchan.com, devel@driverdev.osuosl.org, stephen@networkplumber.org, mario.kleiner.de@gmail.com, manfred@colorfullife.com, oakad@yahoo.com, linux-scsi@vger.kernel.org, mawilcox@microsoft.com, mfasheh@versity.com, richard@nod.at, joro@8bytes.org, jiangyilism@gmail.com, elfring@users.sourceforge.net, cluster-devel@redhat.com, javier@osg.samsung.com, jarkko.sakkinen@linux.intel.com, mingo@redhat.com, vdavydov.dev@gmail.com, kvalo@qca.qualcomm.com, tipc-discussion@lists.sourceforge.net, ogerlitz@mellanox.com, ishkamiel@gmail.com, devicetree@vger.kernel.org, lizefan@huawei.com, huxm@marvell.com, mchehab@kernel.org, johan@kernel.org, aditr@vmware.com, linux-block@vger.kernel.org, robh+dt@kernel.org, Kai.Makisara@kolumbus.fi, hare@suse.de, rminnich@sandia.gov, linux-tegra@vger.kernel.org, dsa@cumulusnetworks.com, intel-gvt-dev@lists.freedesktop.org, jy0922.shim@samsung.com, axboe@kernel.dk, gbhat@marvell.com, tomas.winkler@intel.com, dedekind1@gmail.com, jbacik@fb.com, jarno@ovn.org, vyasevich@gmail.com, krzk@kernel.org, sboyd@codeaurora.org, jiri@mellanox.com, afd@ti.com, ashutosh.dixit@intel.com, yishaih@mellanox.com, rjw@rjwysocki.net, hannes@cmpxchg.org, Bart.VanAssche@sandisk.com, johannes@sipsolutions.net, dwmw2@infradead.org, dasaratharaman.chandramouli@intel.com

Currently, all filters with the same priority are linked in a doubly
linked list. Every filter should have a unique handle. To make the
handle unique, we need to iterate the list every time to see if the
handle exists or not when inserting a new filter. It is time-consuming.
For example, it takes about 5m3.169s to insert 64K rules.

This patch changes cls_flower to use IDR. With this patch, it
takes about 0m1.127s to insert 64K rules. The improvement is huge.

But please note that in this testing, all filters share the same action.
If every filter has a unique action, that is another bottleneck.
Follow-up patch in this patchset addresses that.

Signed-off-by: Chris Mi <chrism@mellanox.com>
Signed-off-by: Jiri Pirko <jiri@mellanox.com>
---
 net/sched/cls_flower.c | 55 +++++++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/net/sched/cls_flower.c b/net/sched/cls_flower.c
index 052e902..071f0ef 100644
--- a/net/sched/cls_flower.c
+++ b/net/sched/cls_flower.c
@@ -68,7 +68,6 @@ struct cls_fl_head {
 	struct rhashtable ht;
 	struct fl_flow_mask mask;
 	struct flow_dissector dissector;
-	u32 hgen;
 	bool mask_assigned;
 	struct list_head filters;
 	struct rhashtable_params ht_params;
@@ -76,6 +75,7 @@ struct cls_fl_head {
 		struct work_struct work;
 		struct rcu_head	rcu;
 	};
+	struct idr handle_idr;
 };
 
 struct cls_fl_filter {
@@ -210,6 +210,7 @@ static int fl_init(struct tcf_proto *tp)
 
 	INIT_LIST_HEAD_RCU(&head->filters);
 	rcu_assign_pointer(tp->root, head);
+	idr_init(&head->handle_idr);
 
 	return 0;
 }
@@ -295,6 +296,9 @@ static void fl_hw_update_stats(struct tcf_proto *tp, struct cls_fl_filter *f)
 
 static void __fl_delete(struct tcf_proto *tp, struct cls_fl_filter *f)
 {
+	struct cls_fl_head *head = rtnl_dereference(tp->root);
+
+	idr_remove(&head->handle_idr, f->handle);
 	list_del_rcu(&f->list);
 	if (!tc_skip_hw(f->flags))
 		fl_hw_destroy_filter(tp, f);
@@ -327,6 +331,7 @@ static void fl_destroy(struct tcf_proto *tp)
 
 	list_for_each_entry_safe(f, next, &head->filters, list)
 		__fl_delete(tp, f);
+	idr_destroy(&head->handle_idr);
 
 	__module_get(THIS_MODULE);
 	call_rcu(&head->rcu, fl_destroy_rcu);
@@ -335,12 +340,8 @@ static void fl_destroy(struct tcf_proto *tp)
 static void *fl_get(struct tcf_proto *tp, u32 handle)
 {
 	struct cls_fl_head *head = rtnl_dereference(tp->root);
-	struct cls_fl_filter *f;
 
-	list_for_each_entry(f, &head->filters, list)
-		if (f->handle == handle)
-			return f;
-	return NULL;
+	return idr_find(&head->handle_idr, handle);
 }
 
 static const struct nla_policy fl_policy[TCA_FLOWER_MAX + 1] = {
@@ -859,27 +860,6 @@ static int fl_set_parms(struct net *net, struct tcf_proto *tp,
 	return 0;
 }
 
-static u32 fl_grab_new_handle(struct tcf_proto *tp,
-			      struct cls_fl_head *head)
-{
-	unsigned int i = 0x80000000;
-	u32 handle;
-
-	do {
-		if (++head->hgen == 0x7FFFFFFF)
-			head->hgen = 1;
-	} while (--i > 0 && fl_get(tp, head->hgen));
-
-	if (unlikely(i == 0)) {
-		pr_err("Insufficient number of handles\n");
-		handle = 0;
-	} else {
-		handle = head->hgen;
-	}
-
-	return handle;
-}
-
 static int fl_change(struct net *net, struct sk_buff *in_skb,
 		     struct tcf_proto *tp, unsigned long base,
 		     u32 handle, struct nlattr **tca,
@@ -890,6 +870,7 @@ static int fl_change(struct net *net, struct sk_buff *in_skb,
 	struct cls_fl_filter *fnew;
 	struct nlattr **tb;
 	struct fl_flow_mask mask = {};
+	unsigned long idr_index;
 	int err;
 
 	if (!tca[TCA_OPTIONS])
@@ -920,13 +901,21 @@ static int fl_change(struct net *net, struct sk_buff *in_skb,
 		goto errout;
 
 	if (!handle) {
-		handle = fl_grab_new_handle(tp, head);
-		if (!handle) {
-			err = -EINVAL;
+		err = idr_alloc(&head->handle_idr, fnew, &idr_index,
+				1, 0x80000000, GFP_KERNEL);
+		if (err)
 			goto errout;
-		}
+		fnew->handle = idr_index;
+	}
+
+	/* user specifies a handle and it doesn't exist */
+	if (handle && !fold) {
+		err = idr_alloc(&head->handle_idr, fnew, &idr_index,
+				handle, handle + 1, GFP_KERNEL);
+		if (err)
+			goto errout;
+		fnew->handle = idr_index;
 	}
-	fnew->handle = handle;
 
 	if (tb[TCA_FLOWER_FLAGS]) {
 		fnew->flags = nla_get_u32(tb[TCA_FLOWER_FLAGS]);
@@ -980,6 +969,8 @@ static int fl_change(struct net *net, struct sk_buff *in_skb,
 	*arg = fnew;
 
 	if (fold) {
+		fnew->handle = handle;
+		idr_replace(&head->handle_idr, fnew, fnew->handle);
 		list_replace_rcu(&fold->list, &fnew->list);
 		tcf_unbind_filter(tp, &fold->res);
 		call_rcu(&fold->rcu, fl_destroy_filter);
-- 
1.8.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
