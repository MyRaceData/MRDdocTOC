import Component from "@glimmer/component";
import { service } from "@ember/service";
import { apiInitializer } from "discourse/lib/api";

const TARGET_SLUG = "trakbox-help"; // e.g. "trakbox-help"

class CategoryOnly extends Component {
  @service router;

  get shouldShow() {
    const route = this.router.currentRoute;
    return (
      route?.name === "discovery.category" &&
      route.attributes?.category?.slug === TARGET_SLUG
    );
  }

  <template>
    {{#if this.shouldShow}}
        <div style="margin-bottom: 24px;">
            <!-- Table of Contents -->
            <div style="background-color: rgb(0,0,0,.5); height: 100%;">
                <h2>Racing TrakBox Help</h2>
                <h3>Table of Contents</h3>
                <h4 style="margin-left: 1rem;">Getting Started</h4>
                <div style="margin-left: 2rem;">
                  <span>New user ? - </span>
                  <a href="https://community.myracedata.com/t/getting-started-guide/344"> Quick Start Guide</a>
                </div>
                <div style="margin-left: 2rem;">
                  <span>What is the Racing TrakBox </span>
                  <a href="https://community.myracedata.com/t/trakbox-introduction-video/60"> Introduction Video</a>
                </div>
                <div style="margin-left: 2rem;">
                  <span>What is </span>
                  <a href="https://community.myracedata.com/pub/what-is-data-acquisition"> data acquisition</a>
                </div>
                <div style="margin-left: 2rem;">
                  <span>Need Help? </span>
                  <a href="https://community.myracedata.com/t/getting-trakbox-support/15/1"> Getting help and support</a>
                </div>
                <br><h4 style="margin-left: 1rem;">TrakBox Dash</h4>
                <div style="margin-left: 2rem;">
                  <span>Introducing the </span>
                  <a href="https://community.myracedata.com/t/using-trakbox-dash/55">Racing TrakBox Dash</a>
                </div>
                <br><h4 style="margin-left: 1rem;">Advanced Topics</h4>
                <div style="margin-left: 2rem;">
                  <span>Phone display </span>
                  <a href="https://community.myracedata.com/t/phone-display-and-littlefs-filesystem/346/1">Development</a>
                </div>
                <div style="margin-left: 2rem;">
                  <span>File Output </span>
                  <a href="https://community.myracedata.com/t/phone-display-and-littlefs-filesystem/346/1">Explaination and units</a>
                </div>
            </div>
        </div>
    {{/if}}
  </template>
}

export default apiInitializer((api) => {
  api.renderInOutlet("above-main-container", CategoryOnly);
});
